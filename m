Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFBDC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE132075C
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wnc1bD7M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OtU2NYBN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="lzgEj+fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE132075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAGwjSLI+MRvMJx2W8B80hUoEkwIK+ZkCx87pfbECWQ=; b=Wnc1bD7MvbhJex
	38aLAVbjcunHclusukljRh7Z8pQy5gDpP0ppzsWhTWNDIDCyNh/kU9vSzqirfZqLHnw1QllovXj7E
	wmbRdFNkP3sizWMvA6+dte6QyVIyQHvMBs32GMuS5lHwUz/YXPBwVHK44BGzCYpvPC7pdWgsYqheI
	9AwMOKfPAJOa52yY9pMDMwMZhvftk7uMpvMUjBwqamRYwD3iVxKTIxsgR6THj+DNb/kOyTYZj2MFg
	VF0WrawaWHXYlA30GkZwGQOLdOR1CWgExL2vts4SvAsCQmDuVzCN7GVZ5wy7Q9XWoxQO6+ht3EpzR
	ZouFdaVPWwy/LetYe6LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZD5n-0000Kz-Q6; Mon, 25 Nov 2019 12:03:47 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZD5l-0000Kd-Be
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 12:03:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12991C279D;
 Mon, 25 Nov 2019 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574683425; bh=8RKCrlNtwYx9mJQB79kgVftpNS5SHz62DUWYULjppEY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OtU2NYBNOat3Mp+2lNp/ByXf8X8r/rlC6Ic7Ie9TDK+UEai0eOJmCDQssh8tpxUyF
 +BcQbLPq3g8S4ofXC85zO9Fnm7pbMkgFQLdPV4SykwXuYRrXB9eVWfDAvBHxtjsgCh
 rRIzomu3GxpWnnLL72YhavSeW/EKRe81v//bt//OR6KX/I+IC9KPQx5eLeLRdYzOyf
 bwDfk5mlM1vGN4btYBblhXv4eyTs16BuLwUk11dkSj9JMb5seA8h94BADqtp2tuZzZ
 ddbJHmK9PW+U+dRmdPNSmfshaHWA+GMVWwZGrpq2ku7W7WVhLJgOxQhL79ZIT50CSl
 2vB7nWQX5zApA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A5CE6A006A;
 Mon, 25 Nov 2019 12:03:44 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 04:03:44 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 04:03:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj0C0C1tMTvFtphmV4CoN44tHYQPHBoT9RMY9WmR9Yzzyd+WI8yrvdvJZPNtdk6eZjtlNPy+JaHN36DYuJLK/OJyh7ShaRGRPa3V1RIoBmS787+8PKKd0eroZpiKLct3etq36OvoVkgFP28Q6jKyepPvSr7cgu84dO1J+Hdzjgd+MwLMt0Oeii8ppTuAHGzPbKBA70OBUked0sOYMY9oFcwXrcSAibzkDYHSO5cmqzPnzePh7t7vSDkpSAuPIcyFY3c9bgfZrq4dlGJlhA5kzVyEq9KN2Eh5fEa7jsGaO2t4kxz8vefFu7zIKytDCLxMppwWblWU7BvL17Hth/hJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RKCrlNtwYx9mJQB79kgVftpNS5SHz62DUWYULjppEY=;
 b=UFulXGRwYqhJqIWiTTM2cRMTawkQG1wNM/plI1MgPrpJ6EDQ4wJxQDxzevq8ZmAEM2PdeQEDaHmv1fqZB2UaN5lpBwsfl3oqNlyeS89wcrrZkcWDYTkTanoFXZT/qd2G9ef8De5TUV1bnFJ0a6GmK+ysVdWcCd21x8pheTsQZDW7enr2HPaVII5nsnNs24oQd3Wm0i+to/04ey50Y4wYN3bfSlWye1zQ5E0kxfqiYUTHieVDZZwMAX7nwuBuMHhgb6DrLZMPblC6ETgoMK+mIll8up6vK+1pbAfFdul0fbKbWvjbLbQ8mCq0OEf+QwTmlNS51z53dJUrMPQW2DReIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RKCrlNtwYx9mJQB79kgVftpNS5SHz62DUWYULjppEY=;
 b=lzgEj+fxkWI+Pw389nVOc0niyVYKelLtHRuUVhvNUrVUarIUTdm0Nq4mAfCNwSq7ar0RPpolwijHRnHTc7YbROUPdZ9UvFvFAJ9OpcNt2aIZNDOwqfeFqO2TiYAyg1wVd2Ydjmorpufz/KF2JcKikIRApgQglWWtuOBsaKfLFmI=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3960.namprd12.prod.outlook.com (52.132.244.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 12:03:42 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 12:03:42 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVCAAAUuAIAAARUg
Date: Mon, 25 Nov 2019 12:03:42 +0000
Message-ID: <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
In-Reply-To: <20191125115502.GA5777@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RPV001WkdFMk16a3RNR1kzWWkweE1XVmhMVGd5TmpndFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRGxqT1dSaE5qTmhMVEJtTjJJdE1URmxZ?=
 =?utf-8?B?UzA0TWpZNExXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5U?=
 =?utf-8?B?a3pOeUlnZEQwaU1UTXlNVGt4TlRjd01qQTROVEkzTXpZeElpQm9QU0l6VWxa?=
 =?utf-8?B?dU0yMUZOVmR6VERGWVJuSktNMHRTWkZwRVpqVnpOakE5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUZDYkVwU1oybExVRlpCVnl0SFpTOTNjekZZZVZGaU5G?=
 =?utf-8?B?bzNMME42Vm1aS1FVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZEYTBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVd0NFYyOXNVVUZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
 =?utf-8?B?VUZCUW0xQlIydEJZbWRDYUVGSE5FRlpkMEpzUVVZNFFXTkJRbk5CUjBWQllt?=
 =?utf-8?B?ZENkVUZIYTBGaVowSnVRVVk0UVdSM1FtaEJTRkZCV2xGQ2VVRkhNRUZaVVVK?=
 =?utf-8?B?NVFVZHpRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdk?=
 =?utf-8?B?QlFVRkJRVUZ1WjBGQlFVZFpRV0ozUWpGQlJ6UkJXa0ZDZVVGSWEwRllkMEoz?=
 =?utf-8?B?UVVkRlFXTm5RakJCUnpSQldsRkNlVUZJVFVGWWQwSnVRVWRaUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZhWjBKMlFVaFZRV0puUW10QlNF?=
 =?utf-8?B?bEJaVkZDWmtGSVFVRlpVVUo1UVVoUlFXSm5RbXhCU0VsQlkzZENaa0ZJVFVG?=
 =?utf-8?B?WlVVSjBRVWhOUVdSUlFuVkJSMk5CV0hkQ2FrRkhPRUZpWjBKdFFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJTalJCUVVGQ2JVRkhPRUZr?=
 =?utf-8?B?VVVKMVFVZFJRV05uUWpWQlJqaEJZMEZDYUVGSVNVRmtRVUoxUVVkVlFXTm5R?=
 =?utf-8?B?bnBCUmpoQlkzZENhRUZITUVGamQwSXhRVWMwUVZwM1FtWkJTRWxCV2xGQ2Vr?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlowRkJRVUZCUVc1blFV?=
 =?utf-8?B?RkJSMWxCWW5kQ01VRkhORUZhUVVKNVFVaHJRVmgzUW5kQlIwVkJZMmRDTUVG?=
 =?utf-8?B?SE5FRmFVVUo1UVVoTlFWaDNRbnBCUnpCQllWRkNha0ZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJRVUZCUVVGQlFVRkJRMEZC?=
 =?utf-8?B?UVVGQlFVTmxRVUZCUVZwblFuWkJTRlZCWW1kQ2EwRklTVUZsVVVKbVFVaEJR?=
 =?utf-8?B?VmxSUW5sQlNGRkJZbWRDYkVGSVNVRmpkMEptUVVoTlFXUkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZDUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnRRVWM0UVdSUlFuVkJSMUZCWTJk?=
 =?utf-8?B?Q05VRkdPRUZqUVVKb1FVaEpRV1JCUW5WQlIxVkJZMmRDZWtGR09FRmtRVUo2?=
 =?utf-8?B?UVVjd1FWbDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJtZEJRVUZIV1VGaWQwSXhR?=
 =?utf-8?B?VWMwUVZwQlFubEJTR3RCV0hkQ2QwRkhSVUZqWjBJd1FVYzBRVnBSUW5sQlNF?=
 =?utf-8?B?MUJXSGRDTVVGSE1FRlpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZEUVVGQlFVRkJRMlZCUVVG?=
 =?utf-8?B?QlduZENNRUZJVFVGWWQwSjNRVWhKUVdKM1FtdEJTRlZCV1hkQ01FRkdPRUZr?=
 =?utf-8?B?UVVKNVFVZEZRV0ZSUW5WQlIydEJZbWRDYmtGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFVRkJRVUZCUVVGQlNVRkJR?=
 =?utf-8?B?VUZCUVVvMFFVRkJRbnBCUjBWQllrRkNiRUZJVFVGWWQwSm9RVWROUVZsM1Fu?=
 =?utf-8?B?WkJTRlZCWW1kQ01FRkdPRUZqUVVKelFVZEZRV0puUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVoTlFWbFJRbk5CUjFWQlkzZENaa0ZJ?=
 =?utf-8?B?UlVGa1VVSjJRVWhSUVZwUlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVGQlFVRmpkMEoxUVVoQlFX?=
 =?utf-8?B?TjNRbVpCUjNkQllWRkNha0ZIVlVGaVowSjZRVWRWUVZoM1FqQkJSMVZCWTJk?=
 =?utf-8?B?Q2RFRkdPRUZOVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZD?=
 =?utf-8?B?ZWtGSE5FRmpRVUo2UVVZNFFXSkJRbkJCUjAxQldsRkNkVUZJVFVGYVVVSm1R?=
 =?utf-8?B?VWhSUVZwUlFubEJSekJCV0hkQ2VrRklVVUZrVVVKclFVZFZRV0puUWpCQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFV?=
 =?utf-8?B?RkJRVzVuUVVGQlNGbEJXbmRDWmtGSGMwRmFVVUkxUVVoalFXSjNRbmxCUjFG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlEwRkJRVUZCUVVFOUlpOCtQQzl0WlhSaFBnPT0=?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d44f1ea5-a5a4-4e6d-07f3-08d7719f8423
x-ms-traffictypediagnostic: CH2PR12MB3960:
x-microsoft-antispam-prvs: <CH2PR12MB396002D6F507CEE01ED7A00AAE4A0@CH2PR12MB3960.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(43544003)(81156014)(99286004)(561944003)(478600001)(26005)(6506007)(55016002)(316002)(6916009)(102836004)(446003)(11346002)(25786009)(2906002)(74316002)(8936002)(9686003)(6246003)(33656002)(54906003)(186003)(4326008)(6436002)(66066001)(8676002)(3846002)(52536014)(71200400001)(86362001)(71190400001)(5660300002)(7116003)(64756008)(66446008)(7696005)(6116002)(66476007)(66556008)(66946007)(76176011)(229853002)(14454004)(81166006)(7736002)(14444005)(256004)(76116006)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3960;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: azLfJT/wv9W3daqpvK08ll3/KLuuWp8bKlZ3LNNicyj6z9PvfMDZAB6wvdzUBoF8VI5ZU4VzKXj00/iC2RjHWrUzVRRdLns0VmlpvP10Wsz55DY3J5NFYNWvMD+WCkhuYVt+dqmv+fDi0zqjBJK5jTzDCK/AqwAJ5csZmvR4jmbIQ+NbeBvdrSKLXe8vpILR45t8J6hVjEeCI79qDLwAWaJPE6BQ8uIe59juI+sbK622Hw/l5j91fN+m7tRdimSlMgxs1Vbcoo4bdPoOXrPHErtk2fzbuL+Xw+pY4HNHxrYtc4WcmbEpPE5YRVoHAQ8FDRSiAD+eE8vtPI2kJLiUrHAA2BB5ZXGMUjbbGLrDKdcVS847CMgKc9zS3LCi37PxI7C16nodVEZeRBdYu7vvu3ecnhEfZyQvZYfKMqNTsh7olQA1TZKUGwflko3HBYfQ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d44f1ea5-a5a4-4e6d-07f3-08d7719f8423
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 12:03:42.5855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUNQwdrUabM/nWr5xqic1FpdzWXrFY94MvPfj22rsW7MstQfnOmuqSb917IITP1COPuBrSDhfHHd6r4RufRE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3960
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_040345_417135_7DC71F13 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Mon, Nov 25, 2019 at 11:55:16

> The 11/25/2019 11:42, Vitor Soares wrote:
> > 
> > Hi Boris,
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Mon, Nov 25, 2019 at 11:34:52
> > 
> > > On Mon, 25 Nov 2019 11:19:44 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > 
> > > > > > > > 
> > > > > > > > I based in all version and tried to pass everything to master.c file.  
> > > > > > > 
> > > > > > > I'm not sure what that means, but okay.
> > > > > > >   
> > > > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > > > > 
> > > > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > > > but sure, we can discuss it after your RFC has been posted.  
> > > > > > 
> > > > > > I need to test if the time that device.c request the mastership and the 
> > > > > > controller has effectively the ownership of the bus is short enough to 
> > > > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > > > housekeeping of bus takeover.
> > > > > >   
> > > > > > > 
> > > > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > > > first one to post a patchset and he never really said he didn't
> > > > > > > want or didn't have time to continue working on this task (not even
> > > > > > > mentioning the time I spent reviewing those patches...).
> > > > > > > 
> > > > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > > > some kind of coordination before the patch is posted).  
> > > > > > 
> > > > > > Honestly it looks like I'm competing on this which is not the case.
> > > > > > I just pointed out my concerns about this adoption because I see several 
> > > > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > > > master code and integrate in your solution.
> > > > > >   
> > > > > 
> > > > > Can you point me to the version of the patch your changes are based on?
> > > > > And also, can you tell me what issues you faced? I would like to check
> > > > > if they are already adressed in my code.  
> > > > 
> > > > I used v3 and v4. From v5, I found useful the switch case (request, 
> > > > deliver, handoff, takeover) in hc side.
> > > > 
> > > > I didn't hardly test how device.c request mastership but I suspect it 
> > > > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > > > not be the master yet.
> > > 
> > > I'm pretty sure we solved that already (that's what
> > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > Can you be a bit more specific? What makes you think the master might
> > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > called?
> > 
> > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > secondary master already owns the bus. Main master can ack the MR request 
> > and not send the CETACCMST immediately.
> >
> 
> In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> status and after I exit from ->request_mastership(), I'm the bus owner.
> If not, error exit code is returned and we can't make the transfers.
> Are you able to implement the same behavior?

You can assume everyone will do in that way. What happen if you receive a 
request or an information from current master?

>  
> > I was thinking to delay i3c_dev_do_priv_xfers_locked() with a work delay 
> > or so. Do you have any idea?
> > 
> > > 
> > > > 
> > > > >   
> > > > > > As I said previous for I3C spec 1.1 secondary master received a big 
> > > > > > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > > > > > any other protocol that implement such kind of feature and for this is 
> > > > > > from far the most complex feature to implement in SO based systems from 
> > > > > > i3c spec.
> > > > > >   
> > > > > > > 
> > > > > > > BTW, you mentioned working on a lot of different topics, but most of
> > > > > > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > > > > > framework/API, ...).  
> > > > > > 
> > > > > > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > > > > > only expose i3c device without device driver yet I'm not happy with 
> > > > > > transfer struct.
> > > > > > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > > > > > need of a tool for ccc (but for testing purposes it would help a lot).
> > > > > >   
> > > > > > > Any plans to post RFCs on those aspects anytime
> > > > > > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > > > > > that each developer work on a different topic instead of duplicating the
> > > > > > > effort...
> > > > > > > 
> > > > > > > Regards,
> > > > > > > 
> > > > > > > Boris  
> > > > > > 
> > > > > > Best regards,
> > > > > > Vitor Soares
> > > > > > 
> > > > > >   
> > > > > 
> > > > > -- 
> > > > > -- 
> > > > > Regards,
> > > > > Przemyslaw Gaj  
> > > > 
> > > > Again sorry for the delay. I will try to send this soon.
> > > 
> > > Can you please share what you have now (even if it's not finished) so
> > > Przemek can start looking at it?
> > 
> > I will try today.
> > 
> > Best regads,
> > Vitor Soares
> > 
> 
> -- 
> -- 
> Przemyslaw Gaj

Best regards,
Vitor Soares
_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
