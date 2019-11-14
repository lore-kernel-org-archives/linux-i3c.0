Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D80AC43215
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4F6206DA
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o++bCSzf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lHp3fTra";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="fZpEMNIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4F6206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCRENiI9A40Am88QsZe2rVILX2r56y8DAj2cP5m8/0Q=; b=o++bCSzfSVHul8
	xPmw020hapBgAYWmftFYEfNwV8q7DB9ccOUu5E91UoBPEzGiPWOQRjCR761+JyH6F5ZV1RnwWi/Un
	tyBx8kfd9JPVgS6kdTRM+0vRRpOEHIwM1rc0A/Fq2Ex9Q+oRTnUd1/AwiFwZdUSV7L+2wu9Qj8TUE
	/pYXzWyFcoil55JQm9f9TY2YPf68VSqHxCID5ETyUbt30/4xkgDwkOvu06ruv8nSGNknreDKsqVdG
	pwD1VBzTqaCd14FwPLjMGOEXrUNHO+pYnD9Iy//RmQsJfm/EumFMQ6YY6hUYUXsPIbE9/bzEZfxxB
	1O/UpxdyiBdhQICS7ptw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVFE7-0003rK-S8; Thu, 14 Nov 2019 13:31:59 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVFE4-0003qT-Lx
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 13:31:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14F3FC0CD1;
 Thu, 14 Nov 2019 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573738315; bh=8To1IlaMk/CNPznsR9V0DEsMfSPWZ6SJvDgcKmV58Ik=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lHp3fTra+n1lR5BwuXPY0UWsUYyYjrFqK4j5HSI8qnd1AdMqwyMV0PS0hVWOULWBF
 +8egClshy+c00o5Tos3fgz0gBzBJiBivuFZb8gE1BDKXN5DWiw3CMLbU+RBpUMsSl6
 iJYJ/ATOoCWGkD/Lyh3Dhl3OhnRQDiox9a24s6p0CW+nPvtbqSc5l31kfateoV8e4H
 c3ylzNjqmnD9mEQIbpwLsVWr3rY/YOJPM2cwtbNGidB38lnpc+XA8bpM5A5VNC2OXX
 1jCzaaoJOk2am9blbUDE/kTRCsK4y3EiHwixs6ATVRxGIBmYbJeQMwfDewvYBBZy/6
 u6zSPc8O3XDOg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9497DA0091;
 Thu, 14 Nov 2019 13:31:54 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 Nov 2019 05:31:36 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 14 Nov 2019 05:31:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRlqDteZnFXqFNce/APrtibZOFx/yrEcwwAnCC2vKNKrAPnrQEi4kxYtXMLpo39R8TTZneSx/SOtCaU9pgdnZIjidZFDoCgwy7JT81uSwrsyklH9O4UqsEOr5r35xv/OKIHM1llZ6/Cnl/iWcNS4dLueXWpn/swOjqU1zs1q78Ppfqlx1ZJJtejp9tOYstcvI7PeT+9R86VN9IB2XlXHFBkgaAifO2X2YgnAOCUWCPBwpOne7gryALQrverkNRXjkWbEOIBQ0Umo0PQrJ79xKWRR0N80FwBRAfGvo79qwY6yNmQkMYN/175gpSvD7CKoOuoXsCpjLpS542MJgIA7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8To1IlaMk/CNPznsR9V0DEsMfSPWZ6SJvDgcKmV58Ik=;
 b=bXMKK+jS6oxQ+Og8fqpAN5D2fr1USKXZacIPt/92ZC7YdyUCjDe/323fHetm71D0Er0L16ChWm6fZaGE6dq88OMzPhv1ecGF1Qg3cdPTCdm0YqeYu1lSpvpBuCbddWcBKC1vLtaNY8liChp15+5MoQ7gfEyCfD6A6h7mUCeS7OUcD8nmTQsE+t0rzEdfazFuVtGO27j3v4GkJgX1tSqfyYlrlxHTYG9gB6ljAfTg4gHkcZzknpqlE3WWTQ+diHN2pipGxfLJmj51/SffSPd2iZktEjKolvD1p7hNUbg14roFhM4qU+J9ZR5VUoKHPsnbX3b8kVOsbYCGgMy1CDDH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8To1IlaMk/CNPznsR9V0DEsMfSPWZ6SJvDgcKmV58Ik=;
 b=fZpEMNIFpjamXX+4oCVz0mDbwyegkQjYc3LrQPGVApTylZY150v8grz6SnCvbV0H7gK5RoSlDN8ZHPZqoYQjtQO9Oawrx4LulpTXWbX+hw+oyrDV0CsGljS0wjDf+iypdpIm6N1GPu52/dMui5S0mr3buYqfxCqvIa+jmYGDEb0=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3880.namprd12.prod.outlook.com (52.132.246.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 13:31:34 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 13:31:34 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 0/3] Add data hold delay support
Thread-Topic: [PATCH 0/3] Add data hold delay support
Thread-Index: AQHVmq/LglrgLyocSke+UXcOLF8KFaeKj84QgAAOkwCAAAtv0A==
Date: Thu, 14 Nov 2019 13:31:33 +0000
Message-ID: <CH2PR12MB4216672A1434669746774917AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <CH2PR12MB4216AF4224EDEE99E6C4B74FAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114124855.GA13588@global.cadence.com>
In-Reply-To: <20191114124855.GA13588@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNVEZoWkRNd05XUXRNRFpsTXkweE1XVmhMVGd5TmpVdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYREV4WVdRek1EVmxMVEEyWlRNdE1URmxZ?=
 =?utf-8?B?UzA0TWpZMUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU9E?=
 =?utf-8?B?Y3lJaUIwUFNJeE16SXhPREl4TVRnNU1qSXpNalkxTVRBaUlHZzlJbnBGYldS?=
 =?utf-8?B?clZVSlFhVXhWUVdKU1FuRmlOR1JMS3paVWMweExaejBpSUdsa1BTSWlJR0pz?=
 =?utf-8?B?UFNJd0lpQmliejBpTVNJZ1kyazlJbU5CUVVGQlJWSklWVEZTVTFKVlJrNURa?=
 =?utf-8?B?MVZCUVVKUlNrRkJSSFZGVVdKVk56VnlWa0ZZUzNnMU5XbFJkRlZ0Um1OeVNH?=
 =?utf-8?B?NXRTa014VTFsVlQwRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?SVFVRkJRVU5yUTBGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZG?=
 =?utf-8?B?UVVGUlFVSkJRVUZCYTNoWGIyeFJRVUZCUVVGQlFVRkJRVUZCUVVGQlNqUkJR?=
 =?utf-8?B?VUZDYlVGSGEwRmlaMEpvUVVjMFFWbDNRbXhCUmpoQlkwRkNjMEZIUlVGaVow?=
 =?utf-8?B?SjFRVWRyUVdKblFtNUJSamhCWkhkQ2FFRklVVUZhVVVKNVFVY3dRVmxSUW5s?=
 =?utf-8?B?QlIzTkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBG?=
 =?utf-8?B?QlFVRkJRVzVuUVVGQlIxbEJZbmRDTVVGSE5FRmFRVUo1UVVoclFWaDNRbmRC?=
 =?utf-8?B?UjBWQlkyZENNRUZITkVGYVVVSjVRVWhOUVZoM1FtNUJSMWxCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlEwRkJRVUZCUVVObFFVRkJRVnBuUW5aQlNGVkJZbWRDYTBGSVNV?=
 =?utf-8?B?RmxVVUptUVVoQlFWbFJRbmxCU0ZGQlltZENiRUZJU1VGamQwSm1RVWhOUVZs?=
 =?utf-8?B?UlFuUkJTRTFCWkZGQ2RVRkhZMEZZZDBKcVFVYzRRV0puUW0xQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkNRVUZCUVVGQlFVRkJRVWxCUVVGQlFVRktORUZCUVVKdFFVYzRRV1JS?=
 =?utf-8?B?UW5WQlIxRkJZMmRDTlVGR09FRmpRVUpvUVVoSlFXUkJRblZCUjFWQlkyZENl?=
 =?utf-8?B?a0ZHT0VGamQwSm9RVWN3UVdOM1FqRkJSelJCV25kQ1prRklTVUZhVVVKNlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVGblFVRkJRVUZCYm1kQlFV?=
 =?utf-8?B?RkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRDZDBGSFJVRmpaMEl3UVVj?=
 =?utf-8?B?MFFWcFJRbmxCU0UxQldIZENla0ZITUVGaFVVSnFRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJRVUZCUVVGQlFVRkRRVUZC?=
 =?utf-8?B?UVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFVaEpRV1ZSUW1aQlNFRkJX?=
 =?utf-8?B?VkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0UxQlpFRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUpCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhCWkZGQ2RVRkhVVUZqWjBJ?=
 =?utf-8?B?MVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpaMEo2UVVZNFFXUkJRbnBC?=
 =?utf-8?B?UnpCQldYZEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVowRkJRVWRaUVdKM1FqRkJS?=
 =?utf-8?B?elJCV2tGQ2VVRklhMEZZZDBKM1FVZEZRV05uUWpCQlJ6UkJXbEZDZVVGSVRV?=
 =?utf-8?B?RllkMEl4UVVjd1FWbDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVG?=
 =?utf-8?B?YWQwSXdRVWhOUVZoM1FuZEJTRWxCWW5kQ2EwRklWVUZaZDBJd1FVWTRRV1JC?=
 =?utf-8?B?UW5sQlIwVkJZVkZDZFVGSGEwRmlaMEp1UVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJR?=
 =?utf-8?B?VUZCU2pSQlFVRkNla0ZIUlVGaVFVSnNRVWhOUVZoM1FtaEJSMDFCV1hkQ2Rr?=
 =?utf-8?B?RklWVUZpWjBJd1FVWTRRV05CUW5OQlIwVkJZbWRCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVVkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJaMEZCUVVGQlFXNW5RVUZCU0UxQldWRkNjMEZIVlVGamQwSm1RVWhG?=
 =?utf-8?B?UVdSUlFuWkJTRkZCV2xGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVGQlFXTjNRblZCU0VGQlkz?=
 =?utf-8?B?ZENaa0ZIZDBGaFVVSnFRVWRWUVdKblFucEJSMVZCV0hkQ01FRkhWVUZqWjBK?=
 =?utf-8?B?MFFVWTRRVTFSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJRVUZCUVVGS05FRkJRVUo2?=
 =?utf-8?B?UVVjMFFXTkJRbnBCUmpoQllrRkNjRUZIVFVGYVVVSjFRVWhOUVZwUlFtWkJT?=
 =?utf-8?B?RkZCV2xGQ2VVRkhNRUZZZDBKNlFVaFJRV1JSUW10QlIxVkJZbWRDTUVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVGQlFVRkJRVUZuUVVGQlFV?=
 =?utf-8?B?RkJibWRCUVVGSVdVRmFkMEptUVVkelFWcFJRalZCU0dOQlluZENlVUZIVVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVZGQlFVRkJRVUZC?=
 =?utf-8?Q?QUFDQUFBQUFBQT0iLz48L21ldGE+?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e5e2752-496e-45a1-cb69-08d76906f790
x-ms-traffictypediagnostic: CH2PR12MB3880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3880FF43E509834623941194AE710@CH2PR12MB3880.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(81156014)(6246003)(486006)(71190400001)(33656002)(8676002)(71200400001)(55016002)(81166006)(66556008)(76116006)(66946007)(64756008)(2906002)(66446008)(6116002)(3846002)(66476007)(256004)(66066001)(229853002)(9686003)(8936002)(6436002)(26005)(305945005)(14454004)(54906003)(186003)(478600001)(110136005)(102836004)(6636002)(7736002)(4744005)(11346002)(74316002)(446003)(99286004)(76176011)(7696005)(5660300002)(316002)(476003)(6506007)(25786009)(4326008)(52536014)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3880;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q0TbhodVHO6BC7JjH+ieLuc71SzVbarrMaJbr0TBoRRa0iLDB8JmRCDbUtpaTp4ogn7wxf9aRCEb+d0bnJ3B+elKVtSfmPJbn5ooMMWWLObSvmgvdf4wfKUyUbZZ6TBB5BSHJbWWe7BW1aUcim5Xqx4gELy0Tz3MVGIbFqwEeXGrbqCk62nY8YPXIFlpSsQC/Yzv3a42a1qXSiYHuYBql76YaVLnrAQCGEYjWgaloISL99VmKu6DDJwkBP+mAXGJMC7eq7AIekyx1VkTyQiOGK1YK6gyec8m6sPYbmu2o+7kgXGcyt+NWsQZYKLbnvQU4Vtc3jmMoGkF+/gepO5+jFAOIG5wLjGOd58yy3medc1NRLHMYD/LDkwbjAKY3ERp0ojjF57bi13dRn4+o6wXts0kHLvjLFSwiE42E/NTSSz6+DU923g09e8dk4cEtDtp
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5e2752-496e-45a1-cb69-08d76906f790
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 13:31:33.8315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAw8jdwjFSunJyFZ/hlRjpb2oLrUZjSOXTMAMlbATPOd16MvFP+XtnkT8Xxt6MT9UkRqqCTChzb9dDGyELkwow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3880
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_053156_880383_8F178975 
X-CRM114-Status: GOOD (  11.24  )
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
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Thu, Nov 14, 2019 at 12:48:56
> 
> There is new controller functionality which allows to meet SDA to SCL
> propagation time. Baisically, you can delay SDA propagation using this
> functionality to meet I3C MIPI spec timing. This is very useful for some
> SoC designs.
> 
> From Spec:
> Table 75 of MIPI I3C Specification 1.0 (page 142) defines non-zero
> minimal tHD_PP timing on master output (Fig 65). This setting allows to
> meet this timing on master's soc outputs, regardless of PCB balancing.
> 
> > 
> > Best regards,
> > Vitor Soares
> 
> -- 
> -- 
> Przemyslaw Gaj

Thanks for pointing me the right place to read about it.
I would suggest you to put that info in the patch as well.

Best regards,
Vitor Soares
_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
