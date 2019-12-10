Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2147CC43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D8120836
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tr/2Wnoq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dFINMvj6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Y6do5GsA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4D8120836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOieKwMMeWsV2Y20+orZ36ilqoueOtKM0krWRxr63Rw=; b=Tr/2Wnoqizz5Ky
	qpGr+jjZ6+znFBteIZNs5sXE3MVVaAbfDV8cVpEpWpte5A5k4JIHOYRTIR1TLx7CfI7Kkw4nTf6uO
	Dej8hEbx/sGf3Ds/7RF4Q1UlCvxM0DUBpGUtmPxRJZAuCzh4R6bW6ew0Wh6zGcgkSPM7yJZOSbUU7
	/5c5PzFQ16uJ/wVBEuHUOU/I+MF7nS6NAIybmhYHEATQKA4YekPUzYZxO4RMsKMO7bjGGzpvKfWqz
	GXQfG0gU8vjpdLA0HJZO+4Oek4hhS3TUUWHFvzBTZxKLJy3SLRvS4XRf0mm5/y6NHq30i19Jrjd8c
	UM/jG0Rir8eguYBbCKPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegUw-0008Rd-ON; Tue, 10 Dec 2019 14:28:22 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegUu-0008R8-8t
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 14:28:21 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0571E405CE;
 Tue, 10 Dec 2019 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575988098; bh=DR0nhtYc7UUNveo9QX/gxx7/FAlWDeYuM+JJSX1bEJE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dFINMvj6db3zegzrnYvwKRCVw730ZuwZrtpL0FJuRW22M09ebsDRSVQT9bqJXhVEJ
 8w60gTp5pFtFpn8rvCvMBKVNuwcDNlwDAZbBJrFkTtcT+Mau1a8AqT2EVDNUWWO+Bs
 v5smm3aCB9j/VLUDb+4qk2c+Cq9PR/yXWUJnCWIMxClwN+DbmdpfSu9PvDM8QL6WFY
 8ibcMl6cpgm1pLjYERKrR8fLKau6bSe7wwYF7Ni1NM+Q4iE0j28v/ID6Cg15fyWbUV
 /ZL30fn0IhpxVejI6MGpETrCKaTYZFrQsJPGeb6G25kGLpa2umjL0X1tNFbffQ5tFm
 62kgnRK4mRa9Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7FF7AA007E;
 Tue, 10 Dec 2019 14:28:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 06:28:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 06:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhJR186HtYhwD6J0grkaBI8oKEmGr8GQUcfvHxs3vidBWSw73S5XP4mhk+n33mqrXosIuItERxI2IlwyE2zSzJEy+ONFeyr1pOw59QiSS4ysgB4yRk1WoyDkNMyNJ0MR47yTFS/CkO9TpRYZmYLOYMif2R2Afb9S8ZRJ5SpMTdimJshh6jLVpVPHcF3SH/6zjSs+inGFXU9oz2j753odZr8rGCH2/OO5PoHUbjWOvLLLUfbGKcniYWNKCsd0hrOsc+m/+y/USMNbwzXjxsA+TW3ZKkqUlq51xKu7ZrVfi04SvO4uJguUKuYvHmkglYbJFNfRN6hF0e0+ihtF0kuOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR0nhtYc7UUNveo9QX/gxx7/FAlWDeYuM+JJSX1bEJE=;
 b=T4/mpHqYVAiybA6vBA5HDFrNwqNIqnzLstNQDExvKPJ5wcOdm4zrKXn/xE9IQB/hH/1fwiPF8CwGHB6ETYzT19WKrUAmva6HlDulvh7SmrRUGi1EOLLAOw/AfFFaCfVSaAP++BQ1kfUFt/UnXd+YMQtzb8t7hWyuyXyrTbtuUylbY9XL8JRQRg8nELfjCXVOFlMI7BJttAyVIY+lxaIYrRLv4rIP+m+g2mBHZOKdg0Sy0YvihpbyEjjOBT2xUPYdfOZcesuFHsFIck87+fCdacPoxfVw9/Ny/ATHd1GpFYoCYBnNizIHz1DTjrgDs12TQRrJTMqx34QaGbNlEssqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR0nhtYc7UUNveo9QX/gxx7/FAlWDeYuM+JJSX1bEJE=;
 b=Y6do5GsAJ4Iruil+nQN0QPqJvUPFqDLsAeqox/wrAHxyRzhhEdGj75o5yQcuN4o7DOIlzQVpa6xXeA8tSezVu1R+TUsxSD+pWxz4Ko1GQTViaOYg8lmy96bECGVSic75uwDMnJg9cXIuE1HnKbYbspuEL+et/+HNhpNQ3sIdKIU=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4295.namprd12.prod.outlook.com (20.180.6.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 14:28:16 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 14:28:16 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [PATCH] i3c: make sure the PID is set before registering the
 device
Thread-Topic: [PATCH] i3c: make sure the PID is set before registering the
 device
Thread-Index: AQHVrdJ4nZAaAnrnDUGcf9+6qEb26aexj5yAgAAmgfCAAAXyAIABrJRw
Date: Tue, 10 Dec 2019 14:28:15 +0000
Message-ID: <CH2PR12MB4216B9AF8D7BDD7E3A950E9CAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
 <20191209104711.5a549d31@collabora.com>
 <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191209132616.22ba009c@collabora.com>
In-Reply-To: <20191209132616.22ba009c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3ROR0l3TUdZd00yVXRNV0kxT1MweE1XVmhMVGd5TnpJdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRFJpTURCbU1ETm1MVEZpTlRrdE1URmxZ?=
 =?utf-8?B?UzA0TWpjeUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1q?=
 =?utf-8?B?YzJOeUlnZEQwaU1UTXlNakEwTmpFMk9UTTJOelF6T0RneklpQm9QU0l6VW01?=
 =?utf-8?B?SU9FOXNSMEZ5ZDNRd1VqRk9XR3hSYzAxbGFrYzFiWE05SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJNV1hrMFQxcHhMMVpCVjFKbU9GUk9PRU13T0RSYVJp?=
 =?utf-8?B?OTRUVE4zVEZSNlowOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 69806b5f-8f3c-4fd1-35bf-08d77d7d321b
x-ms-traffictypediagnostic: CH2PR12MB4295:
x-microsoft-antispam-prvs: <CH2PR12MB42952AF2705C798A2511829EAE5B0@CH2PR12MB4295.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(55016002)(7696005)(5660300002)(316002)(2906002)(66574012)(33656002)(54906003)(26005)(9686003)(4326008)(186003)(76116006)(66946007)(66556008)(966005)(6916009)(52536014)(8936002)(86362001)(478600001)(71200400001)(8676002)(81166006)(64756008)(81156014)(66446008)(66476007)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4295;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04Nw39HxsQeZsMYfP32TH+09WSy9hf2VP0ig9X1f2BEqaQwkG2OePOLn/b9kqXC00UIMEc4VRZDfOgfX3i/RWrcMVIEhHh2nuTdjZ3d7lpU63uDqsXjjTy/zSC5NjYUbRENlBxu43g0OfwYMkFolcPzMrgUgtJZycGmZZXU+mpoFBy2mbx+rA36kBgd0x0Ub6NV1BsFkLUFr2ardbOOLPYtut7u+Oyr1sNi14mk8kf2Pr0VI/NUkVgtS78OgM2nhixgUTHSUFd+s3yOqvvADQE9kc5nTXe74287y4X7vkyxrl1x/3m3zTivG/VcVDvT1dyJwcPeJFqeXt1hjpA+ugwfXpDTx/je+OrUdYdYEidlR0SlfTGkWdfELqPWXyo63L5J9FgX4ngnwCFu4QJNrX5QAuw5vt+KbqV+MHL7xf4L6GVFxXI9GZ/ah0X7ZtL2vK9OsSUP7Yp/kg8/QSN/FnBUFv5X3oZ2UEtOtREZ9AU8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69806b5f-8f3c-4fd1-35bf-08d77d7d321b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 14:28:15.9530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/t+KtpCM82bEZO7CqorcriCAn8T552bRem7u0kBtbwsxglLnKEoF49LtqEoa8mxcA9xCWcymRN92Ehho4i7Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_062820_329612_2570F169 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: =?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsDQoNCkZyb206IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+DQpEYXRlOiBNb24sIERlYyAwOSwgMjAxOSBhdCAxMjoyNjoxNg0KDQo+IE9uIE1v
biwgOSBEZWMgMjAxOSAxMjoyMDowMyArMDAwMA0KPiBWaXRvciBTb2FyZXMgPFZpdG9yLlNvYXJl
c0BzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiANCj4gPiBIaSBCb3JpcywNCj4gPiANCj4gPiBGcm9t
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPg0KPiA+IERh
dGU6IE1vbiwgRGVjIDA5LCAyMDE5IGF0IDA5OjQ3OjExDQo+ID4gDQo+ID4gPiBPbiBTdW4sIDgg
RGVjIDIwMTkgMTU6MTg6MzQgKzAxMDANCj4gPiA+IFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRl
bmNlLmNvbT4gd3JvdGU6DQo+ID4gPiAgIA0KPiA+ID4gPiBGcm9tOiBQcnplbXlzbGF3IEdhaiA8
cGdhakBjYWRlbmNlLmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IFByb3Zpc2lvbmVkIElEIChQSUQp
IGlzIHRoZSB2YWx1ZSB3aXRoIHdoaWNoIGRldmljZSBkcml2ZXJzIGFyZQ0KPiA+ID4gPiBtYXRj
aGVkLiBJIGNoZWNrIHRoZSB2YWx1ZSBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGRldmljZS4NCj4g
PiA+ID4gICANCj4gPiA+IA0KPiA+ID4gQ2FuIHRoaXMgc2l0dWF0aW9uIChoYXZpbmcgYSBkZXZp
Y2Ugd2l0aCBhIERBIGJ1dCB3aXRob3V0IGEgdmFsaWQgUElEKQ0KPiA+ID4gaGFwcGVuIHJpZ2h0
IG5vdyBvciBpcyB0aGlzIHNvbWV0aGluZyB5b3UgbmVlZCB0byBzdXBwb3J0IHNlY29uZGFyeQ0K
PiA+ID4gbWFzdGVycyB3aG8gcmVjZWl2ZSBkZXZpY2UgREEgKHRocm91Z2ggREVGU1ZMUykgd2l0
aG91dCBiZWluZyBhYmxlIHRvDQo+ID4gPiBxdWVyeSBleHRyYSBpbmZvcm1hdGlvbiB1bnRpbCB0
aGV5IG93biB0aGUgYnVzPyAgDQo+ID4gDQo+ID4gVGhpcyBpcyB0aGUgdXNlIGNhc2Ugd2hlcmUg
YSBkZXZpY2UgZmFpbHMgdGhlIA0KPiA+IGkzY19tYXN0ZXJfcHJlX2Fzc2lnbl9keW5fYWRkcigp
IGFuZCBJIGFscmVhZHkgbWVudGlvbiBpdCBvbiBbMV0uDQo+ID4gSSBzdGlsbCB0aGluayB0aGUg
YmVzdCB3YXkgaXMgdG8gZGV0YWNoL2ZyZWUgdGhlIGRldmljZXMgdGhhdCBmYWlscyANCj4gPiBk
dXJpbmcgaTNjX21hc3Rlcl9wcmVfYXNzaWduX2R5bl9hZGRyKCkuDQo+IA0KPiBBbmQgSSBkaXNh
Z3JlZSAoSSBnYXZlIG15IGFyZ3VtZW50cyBhbHJlYWR5LCBzbyB3b24ndCByZXBlYXQgdGhlbQ0K
PiBoZXJlKS4NCg0KU29ycnkgQm9yaXMsIGRpZCB5b3UgZ2l2ZT8gSSBhc2sgeW91IHNldmVyYWwg
dGltZXMgd2h5IHRvIGtlZXAgbm9uIERBIA0KZGV2aWNlcyBhdHRhY2hlZCB0byB0aGUgYnVzLCB5
ZXQgeW91IHdhc24ndCBhYmxlIHRvIGdpdmUgbWUgYSB0ZWNobmljYWwgDQpyZWFzb24uIEV2ZW4g
ZnJvbSBkZXZpY2UgbW9kZWwgeW91IHNob3VsZCBrZXB0IHRoZW0uDQpIb25lc3RseSwgSSdtIHN0
YXJ0aW5nIGFzayBteXNlbGYgaWYgdGhpcyBpcyBzb21ldGhpbmcgYWdhaW5zdCBiZWNhdXNlIA0K
ZXZlcnkgdGltZSB0aGF0IEknbSB0cnlpbmcgdG8gaW1wcm92ZSBzb21ldGhpbmcgSSBqdXN0IHNl
ZSBkaWZmaWN1bHR5IA0KZnJvbSB5b3VyIHNpZGUuDQoNCj4gQ2FuIHdlIG1vdmUgb24gcGxlYXNl
Pw0KDQpJIHRoaW5rIHlvdSBzaG91bGQgc3RhcnQgbGVhcm5pbmcgdG8gbGlzdGVuIHRoZSBvdGhl
ciBhbmQgaGF2ZSB0aGUgDQpncmVhdG5lc3MgdG8gYWNjZXB0IHRoZSBvdGhlcnMgZXhwZXJpZW5j
ZSBhbmQgb3BpbmlvbnMuIFdpdGggeW91ciANCmV4cGVyaWVuY2UgeW91IHNob3VsZCBhbHJlYWR5
IGxlYXJuIHRoYXQuDQpUaGUgcHJldmlvdXMgcGF0Y2ggbWFrZXMgYWxsIHRoZSBzZW5zZSB5ZXQg
eW91ciByZXNwb25zZSB3YXMgLSBJIGFtIG5vdCANCmNvbnZpbmNlZC4gQ291bGQgeW91IHBsZWFz
ZSBnaXZlIGEgcHJvcGVyIGp1c3RpZmljYXRpb24/IEF0IGxlYXN0IHRlc3QgDQp3aGF0IEkgc3Bl
bmQgdGltZSB0byBkbz8NCg0KPiBDYW4geW91IHNlbmQgYSBuZXcgdmVyc2lvbiB0aGF0IGRvZXMg
d2hhdA0KPiBJIHN1Z2dlc3QsIG9yIHNob3VsZCBJIGFzayBQcnplbWVrIHRvIGRvIGl0Pw0KDQpE
b2VzIHRoZSBldGhpY3MgYXBwcm92ZSBzdWNoIGF0dGl0dWRlPyBEb24ndCB5b3Ugc2VlIHdpdGgg
a2luZCBvZiANCmF0dGl0dWRlIHlvdSBhcmUganVzdCBwdXR0aW5nIHBlb3BsZSBhd2F5IG9mIHRo
aXMgc3Vic3lzdGVtPw0KDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBsaW51eC1pM2MgbWFpbGluZyBsaXN0DQo+IGxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwLTNBX19saXN0cy5pbmZyYWRlYWQub3JnX21haWxtYW5fbGlzdGluZm9fbGludXgt
MkRpM2MmZD1Ed0lHYVEmYz1EUEw2X1hfNkprWEZ4N0FYV3FCMHRnJnI9cVZ1VTY0dTl4NzdZMEtk
MFBoREtfbHB4RmdnNlBLOVBhdGVId2piX0RZMCZtPWNYeVBDSE8ydmhjeUQzYU4tTG5xT3F6b2Ri
QjlnLXV0SlhlV09RUmtKbWsmcz1vZHJ0WWhiLUlhSy1kZlR6aTFwN1R3SDJZSmNuWjNSU2ROTnJL
SmpYRmRNJmU9IA0KDQpCZXN0IHJlZ2FyZHMsDQpWaXRvciBTb2FyZXMNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
