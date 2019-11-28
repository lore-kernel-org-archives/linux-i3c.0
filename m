Return-Path: <SRS0=pqjR=ZU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F4BC432C0
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052B9217BA
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iymvnVmM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RhvlLZMY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="BNA0ADvz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 052B9217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej/lJrU2NDFnSYAufE/JNJtZ6camqf4IPI1QKgt8EOw=; b=iymvnVmMod2/yV
	70evyGt1LRL5vDIAqiSffyuYRdKkGmmeXdfLYtmiYShhmSs3KLr+/pk7PmQlOakKzdofWx9+d6FxX
	OOsFNoDq61sFkAfZhV2mAc5Ri+gXa4L7ztcI9JNMhhVXbdp66JdxNEBjFT+QYKbMzflZuRBXurRW5
	35hwRrtsVUDDImSK0oqs/zqgEVsnhOip5dUw6m5hIrYfBLB1+uNbuxTJqREh+t3zUreAGBIJgb55Q
	CueXi0YZiwsOuSvzOvoiZ0sb4TiB6aYjGSD5sZiBNKykgG+PytmUTFKUtb+dGSNw7wLHKGdM34Ay+
	qbnVVo20Vjqxp4ZnCT4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaImw-0000ke-24; Thu, 28 Nov 2019 12:20:50 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaImr-0000hL-3N
 for linux-i3c@lists.infradead.org; Thu, 28 Nov 2019 12:20:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF4D4C04B9;
 Thu, 28 Nov 2019 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574943641; bh=a6ylxqU6d4nUZ/XzKrITdJZq7s1my/kbWV5kCh3M3UE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RhvlLZMYaRzAp14o8tZL99b7sMtuieFoAnHS2DnuzOc4mHkGBCFBSPB8ig0F2lDq+
 SOO7VgbFPbyecn7j4V8whjttFuFVOTxjEAC3cwn2No3k3LhpULLzQozyqlHdyXm+qn
 Y3Hes6583cjfbjuGO6aym7iGuxy/8jJc8az8wOD/nApE5NtWLWqVbCLRRD9ugDCLQu
 m2Qy9TTmZuCmztZwVT57/X8hFR74+XnAwbZjEsU38XJKTNT0aIT/ygG4N05/vXlMKQ
 3FRtl6HntlcaWp9KZFXjnB8CEa7tviirksfIm2YnJUb0JyN51eHL8DnwBg9SgOnkwo
 fqCMMQ8gYyEYQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C9879A0069;
 Thu, 28 Nov 2019 12:20:34 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 28 Nov 2019 04:20:18 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 28 Nov 2019 04:20:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB5aMfFJkLkBYVQ9j5cxeATT+l5N0Jx5ZKCIIPKj7DwcydbxwVFSYXiVcqqMM/s9I1lOKmQe06J39QccsgLiu+6tKBSDwj2WrGBIAMq3yJqVji1eTuJkHSkgVJTxeBbzjfyUNVYcDQoojTL2N+HCqk3r44YQLa6+cX3ZnEx8XXVLjVIDEBkbEGbtbn21u8BIvkzKeeS4hAVMPKsCW0X0O5t1zCWHlhzv5alPb4Bz0gFCvV+KTw1N2+R57WxpxSMGen+2qiQI7LGWU4nd+tCAeTwLOWq8UPslLIw3Oj4/9XurX8krxbpLXXjMOh8Dym7qq43rjggER5W4x+d8DVtTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6ylxqU6d4nUZ/XzKrITdJZq7s1my/kbWV5kCh3M3UE=;
 b=ltMRlHAM5lZMAUSOaD78HS0mj44UOeYjnQwogQm7ZrqnyHuRODLWPLPUZMmRR5/gPfCULD5syxztPOrBb9GwnzY8eJQYbTr3tkdZocFeMju/FazIpLMLpROSm+HM2B/BVQRawchcFJCTxO0XRtH1wcLl4+Cm6XKGAb/FirkUK1I1CueayVdb20Vk8F7+6NRkpemTIpnEFcI41I2zuEubU+nJR6okgXmykcu8Ty313Ajt6ZcuoBWVgf3B3Ncu3eVnOYKXQrhC7ZqVwtvHKs3L2ndcVm/b1Tmw2EoCeMSbDFd2WG3gpRhg2pbU42vkGUz6AGDiIejbN8KOJ6rbITPXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6ylxqU6d4nUZ/XzKrITdJZq7s1my/kbWV5kCh3M3UE=;
 b=BNA0ADvzQX3owznR3yq6wR1aTXjT4Ew/tg/YuwnK7GzLuD02qRlxKGaKt521PXpaHjiYbYossLM8T84R5HZ5pN8wL1Bapo2cWcjHmLliv0JHJ8X+UTu1wbJlWp+V4X5q5BwRW0hw0bMFvIzZ7yINoK9zkJTv8Tf7lvX7CVY71qA=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3896.namprd12.prod.outlook.com (52.132.244.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 28 Nov 2019 12:20:15 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 12:20:15 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: [RFC 1/2] i3c: Add preliminary support for secondary master
Thread-Topic: [RFC 1/2] i3c: Add preliminary support for secondary master
Thread-Index: AQHVpYlf/y/LGVd1H0qncRk+0CYXjqegFE4AgABVLhA=
Date: Thu, 28 Nov 2019 12:20:15 +0000
Message-ID: <CH2PR12MB4216CDCF7713E8F8929E66FAAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
 <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
 <20191128055007.GA11250@global.cadence.com>
In-Reply-To: <20191128055007.GA11250@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RObVF4WXpVNU5HRXRNVEZrT1MweE1XVmhMVGd5Tm1JdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRFprTVdNMU9UUmlMVEV4WkRrdE1URmxZ?=
 =?utf-8?B?UzA0TWpaaUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1q?=
 =?utf-8?B?VTNNRE1pSUhROUlqRXpNakU1TkRFM01qRXpORFU1TURZNE9DSWdhRDBpWkZO?=
 =?utf-8?B?RFZsSXdWMmhUT0U1YWFHeG9TV0pSZVU1YWJIVjFkVVZCUFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlFsRktRVUZFWjJsSVZYWTFjVmhXUVZKQmIxRmlRallyTTNCQ1JV?=
 =?utf-8?B?Tm9Rbk5JY2pkbGEwVlBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVaEJRVUZCUTJ0RFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVWQlFWRkJRa0ZCUVVGcmVGZHZiRkZCUVVGQlFVRkJRVUZCUVVGQlFVRktO?=
 =?utf-8?B?RUZCUVVKdFFVZHJRV0puUW1oQlJ6UkJXWGRDYkVGR09FRmpRVUp6UVVkRlFX?=
 =?utf-8?B?Sm5RblZCUjJ0QlltZENia0ZHT0VGa2QwSm9RVWhSUVZwUlFubEJSekJCV1ZG?=
 =?utf-8?B?Q2VVRkhjMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?blFVRkJRVUZCYm1kQlFVRkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRD?=
 =?utf-8?B?ZDBGSFJVRmpaMEl3UVVjMFFWcFJRbmxCU0UxQldIZENia0ZIV1VGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkRRVUZCUVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFV?=
 =?utf-8?B?aEpRV1ZSUW1aQlNFRkJXVkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0Ux?=
 =?utf-8?B?QldWRkNkRUZJVFVGa1VVSjFRVWRqUVZoM1FtcEJSemhCWW1kQ2JVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUpCUVVGQlFVRkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhC?=
 =?utf-8?B?WkZGQ2RVRkhVVUZqWjBJMVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpa?=
 =?utf-8?B?MEo2UVVZNFFXTjNRbWhCUnpCQlkzZENNVUZITkVGYWQwSm1RVWhKUVZwUlFu?=
 =?utf-8?B?cEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVow?=
 =?utf-8?B?RkJRVWRaUVdKM1FqRkJSelJCV2tGQ2VVRklhMEZZZDBKM1FVZEZRV05uUWpC?=
 =?utf-8?B?QlJ6UkJXbEZDZVVGSVRVRllkMEo2UVVjd1FXRlJRbXBCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5C?=
 =?utf-8?B?UVVGQlFVRkRaVUZCUVVGYVowSjJRVWhWUVdKblFtdEJTRWxCWlZGQ1prRklR?=
 =?utf-8?B?VUZaVVVKNVFVaFJRV0puUW14QlNFbEJZM2RDWmtGSVRVRmtRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGSlFVRkJRVUZCU2pSQlFVRkNiVUZIT0VGa1VVSjFRVWRSUVdO?=
 =?utf-8?B?blFqVkJSamhCWTBGQ2FFRklTVUZrUVVKMVFVZFZRV05uUW5wQlJqaEJaRUZD?=
 =?utf-8?B?ZWtGSE1FRlpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVVkJRVUZCUVVGQlFVRkJaMEZCUVVGQlFXNW5RVUZCUjFsQlluZENN?=
 =?utf-8?B?VUZITkVGYVFVSjVRVWhyUVZoM1FuZEJSMFZCWTJkQ01FRkhORUZhVVVKNVFV?=
 =?utf-8?B?aE5RVmgzUWpGQlJ6QkJXWGRCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVG?=
 =?utf-8?B?QlFWcDNRakJCU0UxQldIZENkMEZJU1VGaWQwSnJRVWhWUVZsM1FqQkJSamhC?=
 =?utf-8?B?WkVGQ2VVRkhSVUZoVVVKMVFVZHJRV0puUW01QlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJR?=
 =?utf-8?B?VUZCUVVGS05FRkJRVUo2UVVkRlFXSkJRbXhCU0UxQldIZENhRUZIVFVGWmQw?=
 =?utf-8?B?SjJRVWhWUVdKblFqQkJSamhCWTBGQ2MwRkhSVUZpWjBGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZuUVVGQlFVRkJibWRCUVVGSVRVRlpVVUp6UVVkVlFXTjNRbVpC?=
 =?utf-8?B?U0VWQlpGRkNka0ZJVVVGYVVVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVZGQlFVRkJRVUZCUVVGRFFVRkJRVUZCUTJWQlFVRkJZM2RDZFVGSVFV?=
 =?utf-8?B?RmpkMEptUVVkM1FXRlJRbXBCUjFWQlltZENla0ZIVlVGWWQwSXdRVWRWUVdO?=
 =?utf-8?B?blFuUkJSamhCVFZGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVSkJRVUZCUVVGQlFVRkJTVUZCUVVGQlFVbzBRVUZC?=
 =?utf-8?B?UW5wQlJ6UkJZMEZDZWtGR09FRmlRVUp3UVVkTlFWcFJRblZCU0UxQldsRkNa?=
 =?utf-8?B?a0ZJVVVGYVVVSjVRVWN3UVZoM1FucEJTRkZCWkZGQ2EwRkhWVUZpWjBJd1FV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdkQlFV?=
 =?utf-8?B?RkJRVUZ1WjBGQlFVaFpRVnAzUW1aQlIzTkJXbEZDTlVGSVkwRmlkMEo1UVVk?=
 =?utf-8?B?UlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJRVUZC?=
 =?utf-8?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fed1579-571f-41c1-02eb-08d773fd533b
x-ms-traffictypediagnostic: CH2PR12MB3896:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3896917D2B50BC210D2835A9AE470@CH2PR12MB3896.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(446003)(11346002)(186003)(14454004)(2906002)(26005)(6116002)(33656002)(25786009)(3846002)(5660300002)(478600001)(66066001)(256004)(305945005)(52536014)(5024004)(71200400001)(71190400001)(14444005)(66946007)(66556008)(66446008)(66476007)(76116006)(74316002)(64756008)(6436002)(99286004)(4326008)(55016002)(30864003)(7736002)(102836004)(316002)(54906003)(107886003)(8936002)(86362001)(6916009)(81156014)(8676002)(81166006)(6246003)(7696005)(76176011)(6506007)(229853002)(9686003)(559001)(579004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3896;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4lSYejRK4jnC1WACVf/DGLakKq2iexjQRouu+wkAV6Pd3gOmP6PWVeifa8BexxafJYQMR+Qkwkfo2z13hnQJpjxmKs8wl7s09MipJrsw6aNsIeNi+o0/tHBI0+8i7mncHfbfx0/7kPnqTUxKN+d3XSohzCbK+v51OR4fG/htt7WB4UvDFTGhyRgsZR/RyaGER0JPDEDbGbP6CmF1PzZlMKGDOYZfDklPpUltsl7XtIegDLvc1KePnExX1d4qSwqaASkHyVNIyNo1Z53hK7Ng92y1/qchhFD+u+SjlAy1X4oRejampAR0+tCBszflAJYIhlDXDxPEN/oXSHGQnYbHYnBpSztVdf43yV2+LJunda2fHERD1POlsIXFEpPPLgVIA0eVW3lw4mD8Q3QFwN0kZx/0DHhqbdI5VqFmiZa5kAGSCQknZ/4TwIR0fuFK1AOd
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fed1579-571f-41c1-02eb-08d773fd533b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 12:20:15.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJVq1O0YjjAdia6x7TJww7yxQzibz/3KRQPcJkQMCIVvE6jdAIkllCXROXrGaUTm4NCZ4sX3NjNe68uRaQCISw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3896
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_042045_253423_3A8EFF9A 
X-CRM114-Status: GOOD (  11.76  )
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
 Joao Pinto <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,


From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Thu, Nov 28, 2019 at 05:50:08

> Hi Vitor,
> 
> First, you woke up my son and he couldn't sleep the rest of the night
> :-)

Sorry for that.

> I appreciate you sent that so we can discuss it.
> 
> The 11/28/2019 02:15, Vitor Soares wrote:
> > 
> > This patch adds the preliminary support for secondary master feature to
> > i3c Framework for testing purposes.
> > 
> > Key points for consideration:
> >   - mastership_[show/store] are only used for testing
> >   - secondary master registration is made in two steps, one in
> >   i3c_master_register() and another in i3c_sec_master_bus_init() when
> >   secondary master became current master first time. This is made in this
> >   way to get all dt declared boardinfo list, create defslvs list and
> >   provide work_queue.
> >   - When the current master wants to deliver_mastership it necessary to
> >   disable all in-band events to avoid unwanted interrupt during bus
> >   ownership exchange. For now this patch doesn't reflect all
> >   improvements/changes made in v1.1 I3C Bus spec. But it can be extended
> >   by adding some commands and checks to the flow.
> >   - i3c_defslvs_info: The DEFSLVS info can be differently stored in
> >   diferen HC. Hence it is used a defslvs list similar to boardinfo list in
> >   the bus structure to hold this data. Them HC is taccking over the bus
> >   ownership can initialize each device of that list. For now, this not
> >   address the i2c devices since they are only statically described.
> >   - [request/deliver]_mastership(): Mastership request deliver may be done
> >   differently in different HC, hence the need to have a call back for each
> >   process.
> >   - Add dr_mode to DT: Similar to USB, HC can be programmed to Master only
> >   mode, Slave only mode or Secondary Master which aren't necessarily
> >   hardcoded.
> >   - bus_mode definition: The bus mode is defined even without defslvs
> >   information with DT info since the definition of i2c devices are those
> >   that have impact on bus_mode definition and need to statically declared.
> >   The only use case that may cause issues is when i2c devices aren't
> >   declared in secondary master side and bus mode doesn't match the
> >   main master. Anyway this can be solde without extra complexity.
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master.c       | 365 ++++++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/i3c/master.h |  39 +++++
> >  2 files changed, 396 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 0436916..b398d77 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -449,6 +449,46 @@ static ssize_t mode_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(mode);
> >  
> > +static ssize_t
> > +mastership_show(struct device *dev, struct device_attribute *da, char *buf)
> > +{
> > +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> > +	ssize_t ret;
> > +
> > +	if (master->secondary)
> > +		ret = sprintf(buf, "Secondary Master\n");
> > +	else
> > +		ret = sprintf(buf, "Master\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t
> > +mastership_store(struct device *dev, struct device_attribute *attr,
> > +		 const char *buf, size_t count)
> > +{
> > +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> > +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> > +
> > +	if (i3cbus->cur_master == master->this) {
> > +		dev_err(dev, "I'm current mater.");
> > +		return count;
> > +	}
> > +
> > +	if (!master->ops->request_mastership) {
> > +		dev_err(dev, "mastership_request not supported.");
> > +		return count;
> > +	}
> > +
> > +	if (master->ops->request_mastership(master))
> > +		dev_err(dev, "mastership_request failed");
> > +	else
> > +		dev_err(dev, "mastership_request success");
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(mastership);
> > +
> >  static ssize_t current_master_show(struct device *dev,
> >  				   struct device_attribute *da,
> >  				   char *buf)
> > @@ -457,8 +497,11 @@ static ssize_t current_master_show(struct device *dev,
> >  	ssize_t ret;
> >  
> >  	i3c_bus_normaluse_lock(i3cbus);
> > -	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > -		      i3cbus->cur_master->info.pid);
> > +	if (i3cbus->cur_master)
> > +		ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > +			      i3cbus->cur_master->info.pid);
> > +	else
> > +		ret = sprintf(buf, "Not Current Master\n");
> >  	i3c_bus_normaluse_unlock(i3cbus);
> >  
> >  	return ret;
> > @@ -497,6 +540,7 @@ static DEVICE_ATTR_RO(i2c_scl_frequency);
> >  
> >  static struct attribute *i3c_masterdev_attrs[] = {
> >  	&dev_attr_mode.attr,
> > +	&dev_attr_mastership.attr,
> >  	&dev_attr_current_master.attr,
> >  	&dev_attr_i3c_scl_frequency.attr,
> >  	&dev_attr_i2c_scl_frequency.attr,
> > @@ -854,6 +898,53 @@ int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
> >  EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
> >  
> >  /**
> > + * i3c_master_getaccmst_locked() - send an GETACCMST CCC command
> > + * @master: master used to send frames on the bus
> > + * @addr: a valid I3C slave address
> > + *
> > + * Sends an GETACCMST CCC command to offer bus Mastership to an
> > + * I3C Secondary Master.
> > + *
> > + * This function must be called with the bus lock held in write mode.
> > + *
> > + * Return: 0 in case of success, a positive I3C error code if the error is
> > + * one of the official Mx error codes, and a negative error code otherwise.
> > + */
> > +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr)
> > +{
> > +	enum i3c_addr_slot_status addrstat;
> > +	struct i3c_ccc_getaccmst *accmst;
> > +	struct i3c_ccc_cmd_dest dest;
> > +	struct i3c_ccc_cmd cmd;
> > +	int ret;
> > +
> > +	if (!master)
> > +		return -EINVAL;
> > +
> > +	addrstat = i3c_bus_get_addr_slot_status(&master->bus, addr);
> > +	if (addr == I3C_BROADCAST_ADDR || addrstat != I3C_ADDR_SLOT_I3C_DEV)
> > +		return -EINVAL;
> > +
> > +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> > +	if (!accmst)
> > +		return -ENOMEM;
> > +
> > +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> > +
> > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (accmst->newmaster >> 1 != addr)
> 
> I really like this check. This is something I realized working
> on next patch version.
> 
> > +		ret = -EIO;
> > +out:
> > +	i3c_ccc_cmd_dest_cleanup(&dest);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_getaccmst_locked);
> > +
> > +/**
> >   * i3c_master_defslvs_locked() - send a DEFSLVS CCC command
> >   * @master: master used to send frames on the bus
> >   *
> > @@ -1542,8 +1633,7 @@ int i3c_master_set_info(struct i3c_master_controller *master,
> >  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> >  		return -EINVAL;
> >  
> > -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> > -	    master->secondary)
> > +	if (I3C_BCR_DEVICE_ROLE(info->bcr) != I3C_BCR_I3C_MASTER)
> >  		return -EINVAL;
> >  
> >  	if (master->this)
> > @@ -2381,6 +2471,81 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
> >  	return 0;
> >  }
> >  
> > +int i3c_sec_master_bus_init(struct i3c_master_controller *master)
> > +{
> > +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > +	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> > +	enum i3c_bus_mode mode = i3cbus->mode;
> > +	struct i3c_defslvs_info *defslvsinfo;
> > +	int ret = 0;
> > +
> > +	if (master->init_done)
> > +		return -EINVAL;
> > +
> > +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> > +		if (defslvsinfo->slave.dyn_addr)
> > +			continue;
> > +
> > +		switch (defslvsinfo->slave.lvr & I3C_LVR_I2C_INDEX_MASK) {
> > +		case I3C_LVR_I2C_INDEX(0):
> > +			if (mode < I3C_BUS_MODE_MIXED_FAST)
> > +				mode = I3C_BUS_MODE_MIXED_FAST;
> > +			break;
> > +		case I3C_LVR_I2C_INDEX(1):
> > +		case I3C_LVR_I2C_INDEX(2):
> > +			if (mode < I3C_BUS_MODE_MIXED_SLOW)
> > +				mode = I3C_BUS_MODE_MIXED_SLOW;
> > +			break;
> > +		default:
> > +			ret = -EINVAL;
> > +			goto err_put_dev;
> > +		}
> > +		if (defslvsinfo->slave.lvr & I3C_LVR_I2C_FM_MODE)
> > +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> > +	}
> > +
> > +	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> > +	if (ret)
> > +		goto err_put_dev;
> > +
> > +	/*
> > +	 * Now execute the controller specific ->bus_init() routine, which
> > +	 * might configure its internal logic to match the bus limitations.
> > +	 */
> > +	ret = master->ops->bus_init(master);
> > +	if (ret)
> > +		goto err_put_dev;
> > +
> > +	/*
> > +	 * The master device should have been instantiated in ->bus_init(),
> > +	 * complain if this was not the case.
> > +	 */
> > +	if (!master->this) {
> > +		dev_err(&master->dev,
> > +			"master_set_info() was not called in ->bus_init()\n");
> > +		ret = -EINVAL;
> > +		goto err_put_dev;
> > +	}
> > +
> > +	ret = device_add(&master->dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> > +	 * through the I2C subsystem.
> > +	 */
> > +	ret = i3c_master_i2c_adapter_init(master);
> > +	if (ret)
> > +		goto err_put_dev;
> > +
> > +	master->init_done = true;
> > +
> > +err_put_dev:
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_sec_master_bus_init);
> > +
> >  /**
> >   * i3c_master_register() - register an I3C master
> >   * @master: master used to send frames on the bus
> > @@ -2413,10 +2578,6 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	struct i2c_dev_boardinfo *i2cbi;
> >  	int ret;
> >  
> > -	/* We do not support secondary masters yet. */
> > -	if (secondary)
> > -		return -ENOTSUPP;
> > -
> >  	ret = i3c_master_check_ops(ops);
> >  	if (ret)
> >  		return ret;
> > @@ -2430,6 +2591,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	master->secondary = secondary;
> >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> > +	INIT_LIST_HEAD(&master->defslvs);
> >  
> >  	ret = i3c_bus_init(i3cbus);
> >  	if (ret)
> > @@ -2475,6 +2637,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  		goto err_put_dev;
> >  	}
> >  
> > +	if (secondary)
> > +		return 0;
> > +
> >  	ret = i3c_master_bus_init(master);
> >  	if (ret)
> >  		goto err_put_dev;
> > @@ -2547,6 +2712,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >  	if (!master || !xfers)
> >  		return -EINVAL;
> >  
> > +	if (master->bus.cur_master != master->this) {
> > +		master->ops->request_mastership(master);
> > +		return -EBUSY;
> 
> I don't like this approach, so you have to re-trigger the operation when
> this master becomes current master. It is not transparent. Especially,
> HCI 1.1 describes the process in detail, even  on flow chart and you can 
> see there that you should block all the transfers/tasks on your side and
> wait for GETACCMST.

I forgot to explain that this is part is not fully operational and my 
intention was to address this in near future.
To quickly head-up, what I had in my mind when did this was if a device 
wants to do a xfer and sec master is not current master the framework 
will request the bus ownership and them pass a EBUSY in case of success 
or another error in case current master Nacks the MR request.

> 
> > +	}
> > +
> >  	if (!master->ops->priv_xfers)
> >  		return -ENOTSUPP;
> >  
> > @@ -2638,6 +2808,185 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> >  	dev->ibi = NULL;
> >  }
> >  
> > +static const char *const i3c_dr_modes[] = {
> > +	[I3C_DR_MODE_MASTER]		= "master",
> > +	[I3C_DR_MODE_SEC_MASTER]	= "sec-master",
> > +	[I3C_DR_MODE_SLAVE]		= "slave",
> > +};
> > +
> > +static enum i3c_dr_mode i3c_get_dr_mode_from_string(const char *str)
> > +{
> > +	int ret;
> > +
> > +	ret = match_string(i3c_dr_modes, ARRAY_SIZE(i3c_dr_modes), str);
> > +	return (ret < 0) ? I3C_DR_MODE_MASTER : ret;
> > +}
> > +
> > +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev)
> > +{
> > +	const char *dr_mode;
> > +	int err;
> > +
> > +	err = device_property_read_string(dev, "dr-mode", &dr_mode);
> > +	if (err < 0)
> > +		return I3C_DR_MODE_MASTER;
> > +
> > +	return i3c_get_dr_mode_from_string(dr_mode);
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_get_dr_mode);
> > +
> > +int i3c_sec_master_request_mastership(struct i3c_master_controller *master)
> > +{
> > +	int ret;
> > +
> > +	i3c_bus_normaluse_lock(&master->bus);
> > +	ret = master->ops->request_mastership(master);
> > +	i3c_bus_normaluse_unlock(&master->bus);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_sec_master_request_mastership);
> > +
> > +int i3c_master_deliver_mastership(struct i3c_master_controller *master, u8 addr)
> 
> I agree, wa can introduce this now. But we decided to postpone it. As
> you can see, it shouldn't be so hard.

IMO this is important, I could use directly the CCC but I know that there 
is other HC that may use a different approach.

> 
> > +{
> > +	struct i3c_dev_desc *dev;
> > +	int ret;
> > +
> > +	i3c_bus_normaluse_lock(&master->bus);
> > +	i3c_bus_for_each_i3cdev(&master->bus, dev) {
> > +		if (dev->ibi) {
> > +			mutex_lock(&dev->ibi_lock);
> > +			i3c_dev_disable_ibi_locked(dev);
> > +			mutex_unlock(&dev->ibi_lock);
> > +		}
> > +	}
> > +	i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
> > +				I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> > +
> > +	ret = master->ops->deliver_mastership(master, addr);
> > +	i3c_bus_normaluse_unlock(&master->bus);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_deliver_mastership);
> > +
> > +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> > +			     struct i3c_ccc_dev_desc defslvs)
> > +{
> > +	struct i3c_defslvs_info *defslvsinfo;
> > +	struct device *dev = &master->dev;
> > +
> > +	i3c_bus_maintenance_lock(&master->bus);
> > +	defslvsinfo = devm_kzalloc(dev, sizeof(*defslvsinfo), GFP_KERNEL);
> > +	if (!defslvsinfo)
> > +		return -ENOMEM;
> > +
> > +	defslvsinfo->slave = defslvs;
> > +
> > +	list_add_tail(&defslvsinfo->node, &master->defslvs);
> 
> I don't get why can't we call i3c_master_add_i3c_dev_locked when
> populating the bus.

I want to avoid the populating bus call back.

> You have all the data on your plate (in HC driver)
> when you are populating it from SEC_DEV_CHAR_TABLE_LOC.

Yes, I told you that I have a table for that, yet I decide to not use it. 
My concern is about the HC that doesn't have?
For me passing this task for the framework is more universal. 

> 
> I decided to do it similarly, but then Boris suggested to rework it and
> we use only i3c_master_add_i3c_dev_locked.
> 
> > +
> > +	i3c_bus_maintenance_unlock(&master->bus);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(defslvs_populate_i3c_bus);
> > +
> > +static void i3c_master_add_new_defslvs(struct i3c_master_controller *master)
> > +{
> > +	struct i3c_defslvs_info *defslvsinfo;
> > +
> > +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> > +		/* TODO: add i2c devices to the bus */
> > +		if (!defslvsinfo->slave.dyn_addr)
> > +			continue;
> > +
> > +		if (defslvsinfo->slave.dyn_addr == master->this->info.dyn_addr)
> > +			continue;
> > +
> > +		if (!i3c_bus_dev_addr_is_avail(&master->bus,
> > +					       defslvsinfo->slave.dyn_addr))
> 
> We can add those checks also but we also have i3c_master_attach_i3c_dev
> and i3c_master_get_i3c_addrs which takes care of this everything.

Yes, but them you will be allocating and free devs unnecessarily.

> 
> > +			continue;
> > +
> > +		i3c_master_add_i3c_dev_locked(master, defslvsinfo->slave.dyn_addr);
> > +	}
> > +
> > +	while (!list_empty(&master->defslvs)) {
> > +		defslvsinfo = list_first_entry(&master->defslvs,
> > +					       struct i3c_defslvs_info, node);
> > +		list_del(&defslvsinfo->node);
> 
> I feel like this code is redundant, we have to allocate it, then delete.

No. you need to clean the list. I may receive another one in the future 
due a HJ or a dynamic address change.

> 
> > +	}
> > +}
> > +
> > +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> > +				     bool secondary)
> > +{
> > +	struct i3c_dev_desc *dev;
> > +	int ret;
> > +
> > +	if (master->secondary == secondary)
> > +		return -EEXIST;
> > +
> > +	/* TODO: get the current master information */
> > +	if (secondary)
> > +		master->bus.cur_master = NULL;
> > +	else
> > +		master->bus.cur_master = master->this;
> > +
> > +	if (!master->init_done && !secondary)
> > +		i3c_sec_master_bus_init(master);
> > +
> > +	master->secondary = secondary;
> > +
> > +	dev_info(&master->dev, "changing to %s\n",
> > +		 master->secondary ? "Sec Master" : "Master");
> > +
> > +	/* TODO: Analyse the use of maintenan_lock for everything */
> > +	if (!list_empty(&master->defslvs) && !secondary) {
> > +		i3c_bus_maintenance_lock(&master->bus);
> > +		i3c_master_add_new_defslvs(master);
> > +		i3c_bus_maintenance_unlock(&master->bus);
> > +
> > +		i3c_bus_normaluse_lock(&master->bus);
> > +		i3c_master_register_new_i3c_devs(master);
> 
> Take a look also at i3c_master_bus_takeover from my latest patch. BTW.
> what about I2C devices? We worked on that also, and this is part of the
> latest patch also. I'm testing it with I2C devices also.

Please check the comments for that. Anyway you can declare the i2c 
devices of DT on both sides, what I think it should be a good practice.

> 
> > +		i3c_bus_normaluse_unlock(&master->bus);
> > +	}
> > +
> > +	if (!secondary) {
> > +		i3c_bus_normaluse_lock(&master->bus);
> > +		i3c_bus_for_each_i3cdev(&master->bus, dev) {
> > +			if (dev->ibi) {
> > +				mutex_lock(&dev->ibi_lock);
> > +				ret = i3c_dev_enable_ibi_locked(dev);
> > +				if (ret)
> > +					dev_err(&master->dev,
> > +						"Failed to re-enable IBI on device %d-%llx",
> > +						master->bus.id, dev->info.pid);
> > +				mutex_unlock(&dev->ibi_lock);
> > +				}
> > +		}
> > +
> > +		/* TODO: Enable MR only for the elegible devices */
> 
> This was postponed also, but we had that before. We can add per-device
> granularity to i3c_master_bus_takeover().

Here we need to do the same as for ibi and maybe get the eligible devices 
from DT or based on its DCR,BCR and PID.
This is something that should be address because it represent a big 
security gap.

> 
> > +		i3c_master_enec_locked(master, I3C_BROADCAST_ADDR,
> > +					I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> > +		i3c_bus_normaluse_unlock(&master->bus);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
> > +
> > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> > +{
> > +	int res;
> > +
> > +	mutex_lock(&i3c_core_lock);
> > +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> > +	mutex_unlock(&i3c_core_lock);
> > +
> > +	return res;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_for_each_dev);
> > +
> >  static int __init i3c_init(void)
> >  {
> >  	return bus_register(&i3c_bus_type);
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index 9cb39d9..09bd99c 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -426,6 +426,8 @@ struct i3c_bus {
> >   *		      for a future IBI
> >   *		      This method is mandatory only if ->request_ibi is not
> >   *		      NULL.
> > + * @request_mastership: Request mastership.
> > + * @deliver_mastership: Deliver mastership
> >   */
> >  struct i3c_master_controller_ops {
> >  	int (*bus_init)(struct i3c_master_controller *master);
> > @@ -452,6 +454,21 @@ struct i3c_master_controller_ops {
> >  	int (*disable_ibi)(struct i3c_dev_desc *dev);
> >  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
> >  				 struct i3c_ibi_slot *slot);
> > +	int (*request_mastership)(struct i3c_master_controller *master);
> > +	int (*deliver_mastership)(struct i3c_master_controller *master,
> > +				  u8 addr);
> > +};
> > +
> > +/**
> > + * struct i3c_defslvs_info - defslvs information object
> > + * @node: used to insert the defslvs object in the  list
> > + * @slave: I3C/I2C device descriptor used for DEFSLVS
> > + *
> > + * This structure is used to hold defslvs information on Secondary Master.
> > + */
> > +struct i3c_defslvs_info {
> > +	struct list_head node;
> > +	struct i3c_ccc_dev_desc slave;
> >  };
> >  
> >  /**
> > @@ -468,6 +485,7 @@ struct i3c_master_controller_ops {
> >   * @boardinfo.i3c: list of I3C  boardinfo objects
> >   * @boardinfo.i2c: list of I2C boardinfo objects
> >   * @boardinfo: board-level information attached to devices connected on the bus
> > + * @defslvs: List of defslvs objects
> >   * @bus: I3C bus exposed by this master
> >   * @wq: workqueue used to execute IBI handlers. Can also be used by master
> >   *	drivers if they need to postpone operations that need to take place
> > @@ -491,6 +509,7 @@ struct i3c_master_controller {
> >  		struct list_head i3c;
> >  		struct list_head i2c;
> >  	} boardinfo;
> > +	struct list_head defslvs;
> >  	struct i3c_bus bus;
> >  	struct workqueue_struct *wq;
> >  };
> > @@ -525,6 +544,7 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
> >  			    u8 evts);
> >  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
> >  			   u8 evts);
> > +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr);
> >  int i3c_master_entdaa_locked(struct i3c_master_controller *master);
> >  int i3c_master_defslvs_locked(struct i3c_master_controller *master);
> >  
> > @@ -652,4 +672,23 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
> >  
> >  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
> >  
> > +enum i3c_dr_mode {
> > +	I3C_DR_MODE_MASTER,
> > +	I3C_DR_MODE_SEC_MASTER,
> > +	I3C_DR_MODE_SLAVE,
> > +};
> > +
> > +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev);
> > +
> > +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> > +				     bool secondary);
> > +
> > +int i3c_sec_master_request_mastership(struct i3c_master_controller *master);
> > +int i3c_master_deliver_mastership(struct i3c_master_controller *master,
> > +				  u8 addr);
> > +
> > +int i3c_sec_master_bus_init(struct i3c_master_controller *master);
> > +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> > +			     struct i3c_ccc_dev_desc defslvs);
> > +
> >  #endif /* I3C_MASTER_H */
> > -- 
> > 2.7.4
> > 
> 
> I feel like this is based on early approach which has evolved by the time
> and I think some of the nice part are missing. The biggest parts to
> discuass are:
> - bus population using devslvs device list instead of using
>   i3c_master_add_i3c_dev locked, have you tried that? If something does
>   not work for you, wa can adjust it but I really want you to try the
>   new approach

To me the i3c_master_add_i3c_dev_locked just need an improvement to 
propagate the boardinfo to all devices, something that already I started, 
and we need to discuss if on secondary master side we can change the 
devices addresses which imply to send DEFSLVS at the end of the process.

> 
> - the way how we are requesting mastership, IMO, we should wait untill
>   the process is finished, as also described in HCI spec for example.

I think you are confusing the concept here. I understand you want to do 
the xfer straight way after receive GETACCMST and I agree with that.
The thing is that you don't know what will happen on the bus between the 
time you send the request and you get the bus ownership. I just think we 
need to find another solution for that like defer the transfer to another 
time and when the controller switch the rule trigger all transfers in the 
pipeline (something like this) even before restore all ibi. If you block 
the bus you are not able to pass the defslvs to the framework.  

>   When I introduce interrupt-based solution, everything should be fine.
>   Could you do that also in your driver?

I did it but had issues and didn't fit in my use case. That the reason I 
did this approach.

> 
> Again, good to have that. I'm really counting on a fair discussion :-)
> 
> -- 
> --
> Regards, 
> Przemyslaw Gaj

As you can see this is based on your work. Off course it as some lose 
ends that should be addressed (like i2c devices, bus mode...) but don't 
have big impact in what I want to show.
For me it is important to rely on framework the way how bus ownership 
exchange is made because it will be easier to maintain in long term and 
we can introduce algorithms for the bus access in the future.

If you are using i3c-tree/next you can apply this directly and if you 
find anything else that isn't going ok please let me know.

Best regards,
Vitor Soares
_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
