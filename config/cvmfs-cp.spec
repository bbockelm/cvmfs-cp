Name:		cvmfs-cp
Version:	0.9
Release:	1%{?dist}
Summary:	A stand-alone tool for downloading files from CVMFS

Group:		Applications/System
License:	Apache 2.0
URL:		http://github.com/bbockelm/cvmfs-cp

# Generate via:
#   git archive --format=tgz --prefix=%{name}-%{version}/ v%{version} > %{name}-%{version}.tar.gz
Source0:	%{name}-%{version}.tar.gz

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:	cvmfs-devel
BuildRequires:  cmake

%description
%{summary}

%prep
%setup -q


%build
%cmake -DPACKAGE_VERSION=%{version}
make %{?_smp_mflags}


%install
make install DESTDIR=%{buildroot}


%files
%defattr(-,root,root,-)
%{_bindir}/cvmfs-cp

%changelog
* Tue May 31 2016 Brian Bockelman <bbockelm@cse.unl.edu> - 0.9-1
- Initial packaging of cvmfs-cp


