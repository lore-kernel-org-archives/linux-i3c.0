Return-Path: <SRS0=FZv/=VM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97889C7618F
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECFB214DA
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2019 07:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELQMjCVf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O7+t4fOe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="es95vHcu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ECFB214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5gWr0hgqbGZyJ9QPnEUvTyYfuh+IIHHkv60FVUkHJY=; b=ELQMjCVf2tnv4g
	CnYsmez2uXR2WAn+HrRU8FdQ+z1NyMxUIKl8JUxNWQNIIebXcU5hvo++TVyIMxJ/jRdPqW6FJDvbd
	QZNsuiUPzHCi+DKnt5ermMzzOYjcfi119TRHtmFx5c8l3MURDDEVMxNuFHwHjIIy+wU+RhMULWrMj
	3U/BPQ4UWWgibbCmN5Lmpx2Sezj9gILeBJQNbb3hHi0vFjHlWFZW6ZmuMST86oqSWhs1WDmWkKrKv
	G9uXgWn6Ze2usOrZvAwzMhZVfcIoj88WwQh92i/v3xgAS5l5bDyarflxhv0AbJOCEadBXyFnkjhhC
	+Tbjm67p2b/eouz+gBcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmvM9-0001Db-1n; Mon, 15 Jul 2019 07:25:05 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hltjM-0000Cv-Dx
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 11:28:52 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2B70C29BB;
 Fri, 12 Jul 2019 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562930926; bh=Epv4WdLEUZ+YXc+qI/wNDsAk5JopowLkGQ7Xv1jzd/Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O7+t4fOetqNr6FLrfigvmIZEcOUaibOJT3YT/Wjz7q4Qmdt2bjp5CMf7TuNTKfcI4
 vomTyEJzPn2uUNGsIfv5qfbEnpKzGJMPdr6juDhB6OWvGNXLgF88ZG0OAoC+S77qka
 MD8oOxQ8WXK5+MQMOH7l+h1tQvuuOZmzkwBZDxu7tZrW/mrFhWsXQreeuilmNRh8qo
 q4srqmcXBwFwH5QYHUfbjCE212A0qTK5FNX+ncFydnfMbAqWM93tkQ40I0EF6z+mVM
 U4+U1UJmCUSmJA1sAJ/GqIN8EUVcU7iJarWbk0j66zY+xNMziKZDVx97COPGUCDxW7
 kxwmQOkebhrlg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 36062A0067;
 Fri, 12 Jul 2019 11:28:40 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Jul 2019 04:28:39 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 12 Jul 2019 04:28:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Epv4WdLEUZ+YXc+qI/wNDsAk5JopowLkGQ7Xv1jzd/Q=;
 b=es95vHcuBARXKDDOQFmbwl9wBhEtdBy0TcdM6HwlH9SKMRLYwP2kGh0aM9v/IgdHTio5sIPrLtEreEQdCh9Czh3gdMdo+NWjLQqyfXgAhTdFGMDH916cxS+MSVShSMLydPXXSEmtZFnwjgw+SB+FoMYrQVjIk4iuls/rW02GORg=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 11:28:37 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::1dbd:69dc:e782:92b6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::1dbd:69dc:e782:92b6%6]) with mapi id 15.20.2073.012; Fri, 12 Jul 2019
 11:28:37 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHVKTzvS0luBz5Hrkq+/RgY+Ornt6bEKIMAgADX5wCAAEBC0IABoPuAgAAJhgA=
Date: Fri, 12 Jul 2019 11:28:36 +0000
Message-ID: <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
 <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190711052440.GA13386@global.cadence.com>
 <SN6PR12MB2655B1D9B6F0135E84FC6D0DAEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712101042.GA4728@global.cadence.com>
In-Reply-To: <20190712101042.GA4728@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNbVJsTjJRek5qRXRZVFE1T0MweE1XVTVMVGd5TkdJdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYREprWlRka016WXlMV0UwT1RndE1URmxP?=
 =?utf-8?B?UzA0TWpSaUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5U?=
 =?utf-8?B?VXpOVGNpSUhROUlqRXpNakEzTkRBME5URXpNemd4T0Rrd01pSWdhRDBpU0dJ?=
 =?utf-8?B?NWJVTkphMGdyWjJWV1dGbzVSVEI0TWpCblYwVmtRVUZuUFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlFsRktRVUZCVjBSRlJIZHdSR3BXUVZwM1ZUUm9NREpLVkVwcGJr?=
 =?utf-8?B?SlVhVWhVV1d4TmJVbFBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVaEJRVUZCUTJ0RFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVWQlFWRkJRa0ZCUVVGV2VtUm9SMmRCUVVGQlFVRkJRVUZCUVVGQlFVRktO?=
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
x-ms-office365-filtering-correlation-id: 7a2c22da-5abf-4862-5dd8-08d706bc14df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2813; 
x-ms-traffictypediagnostic: SN6PR12MB2813:
x-microsoft-antispam-prvs: <SN6PR12MB2813B6C09C5CC1B9A6BCD6BFAEF20@SN6PR12MB2813.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(346002)(136003)(366004)(199004)(189003)(74316002)(9686003)(25786009)(66556008)(64756008)(66476007)(66446008)(14444005)(561944003)(66066001)(8936002)(6116002)(33656002)(76116006)(66946007)(3846002)(4326008)(316002)(71190400001)(102836004)(54906003)(478600001)(110136005)(7736002)(53946003)(99286004)(256004)(305945005)(26005)(186003)(6506007)(71200400001)(76176011)(7696005)(6636002)(5660300002)(6436002)(229853002)(86362001)(8676002)(476003)(11346002)(446003)(2906002)(486006)(81166006)(81156014)(68736007)(53936002)(5024004)(52536014)(14454004)(30864003)(55016002)(6246003)(559001)(579004)(569006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2813;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YRdy7DObEHvZTju6MaIFxaJGrTNQFlTdgwhDmgKDtGtoCKv7rDRaKyzC0oUrV1bGTlmSZikByPfmKecBBbXsYgjfpPCKR0Bdi4RnO8Oi/Vxcop4YiDkrRhQmV0BNkjBenbto8sSq1R0GmqzYb0Zi7zzxuzsH8mQ0xTvUL01Cx6h2OT7+ersu/GejHlXS8Jh8fckmV5yKEavBcGOyY47V9kTVR1aXIks+EfsB2NgQxGWsPm6mn+vyr2ssTy+D4ES/4t0u2eknn2yvIukWjPx8At1ixiD3pfBNRg7tKjIa1rHJ49AoexKYltUinMMQVOFb+sSXzqZCpkOnvYkUJiIPdNh2qNtSi+n6dxUZMG17YdVRcUj5wZDdbMD/5bX668qU5Tt5w9lc9TUzb54zBk7Oske65a+RAxcbNlv/u77xhLE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2c22da-5abf-4862-5dd8-08d706bc14df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 11:28:36.8126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soares@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2813
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_042848_587264_521078DF 
X-CRM114-Status: GOOD (  15.63  )
X-Mailman-Approved-At: Mon, 15 Jul 2019 00:24:58 -0700
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

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Fri, Jul 12, 2019 at 11:10:43

> Hi Vitor,
> 
> The 07/11/2019 10:11, Vitor Soares wrote:
> > EXTERNAL MAIL
> > 
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Thu, Jul 11, 2019 at 06:28:18
> > 
> > > Hi Vitor,
> > > 
> > > The 07/10/2019 18:04, Vitor Soares wrote:
> > > > EXTERNAL MAIL
> > > > 
> > > > 
> > > > From: Przemyslaw Gaj <pgaj@cadence.com>
> > > > Date: Sat, Jun 22, 2019 at 21:55:02
> > > > 
> > > > > This patch adds support for mastership request to I3C subsystem.
> > > > > 
> > > > > Mastership event is enabled globally.
> > > > > 
> > > > > Mastership is requested automatically when device driver
> > > > > tries to transfer data using master controller in slave mode.
> > > > > 
> > > > > There is still some limitation:
> > > > > - I2C devices are registered on secondary master side if boardinfo
> > > > > entry matching the info transmitted through the DEFSLVS frame.
> > > > > 
> > > > > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Main changes between v4 and v5:
> > > > > - Add function to test if master owns the bus
> > > > > - Add i3c_secondary_master_register() function
> > > > > - Add populate_bus() hook to populate the bus after mastership takeover
> > > > 
> > > > For me this task is for the sub-system not the host controller.
> > > > 
> > > 
> > > I'm not sure where device information is stored in DW controller but in CDNS
> > > controller DEFSLVS frame is processed in the device and the only thing I got is
> > > information that DEFSLVS came in. 
> > 
> > When you receive this notification you can add the device to subsystem to 
> > be initialized later when get bus ownership.
> 
> I added this hook mostly because we have to lock the bus during devices
> addition. If we pass DEFSLVS devices information to the system in some
> structure, we should be ok. We can lock the bus in the framework and register
> all the devices. But I still don't feel this is good solution, I'll have to
> do the job once again which HW did before

Your HW just fill a table with the DEFSLVS data and you still have to 
access, retrieve the information and attached to the controller (same 
approach as DAA).

If all these management is passed to the subsystem it will be more easy 
to maintain and HC agonistic.

> 
> @Boris, what do you think about that?
> 
> > 
> > > I need to inform subsystem that there are new
> > > device (if any).
> > > I remember we talkad about that already, you have access to
> > > DEFSLVS information directly, correct?
> > 
> > I can process it in the HC driver, but my point is that I want to rely it 
> > to the subsystem the bus population with the function already present.
> > 
> 
> So, do you want to pack those informations back to i3c_ccc_defslvs and pass to
> the subsystem?

Not necessary. It can be passed addr, bcr, dcr and lvr. 

In the subsystem I think it should be a list of i3c_ccc_defslvs that 
holds DEFSLVS information.

> 
> > > 
> > > > > - Rework device information retrieval to allow adding partialy discovered
> > > > > devices
> > > > > 
> > > > > Main changes between v3 and v4:
> > > > > - Add i3c_master_acquire_bus_ownership to acquire the bus
> > > > > - Refactored the code
> > > > > 
> > > > > Main changes between v2 and v3:
> > > > > - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> > > > > lock from maintenance to normal use
> > > > > - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> > > > > - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> > > > > - Reworked I2C devices registration on secondary master side
> > > > > 
> > > > > Changes in v2:
> > > > > - Add mastership disable event hook
> > > > > - Changed name of mastership enable event hook
> > > > > - Add function to test if master owns the bus
> > > > > - Removed op_mode
> > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > pass full i3c_device_info
> > > > > - Changed name of mastership enable event hook
> > > > > - Add function to test if master owns the bus
> > > > > - Removed op_mode
> > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > pass full i3c_device_info
> > > > > - Removed redundant DEFSLVS command before GETACCMST
> > > > > - Add i3c_master_bus_takeover function. There is a need to lock
> > > > > the bus before adding devices and no matter of the controller
> > > > > devices have to be added after mastership takeover.
> > > > > - Add device registration during initialization on secondary master
> > > > > side. Devices received by DEFSLVS (if occured). If not, device
> > > > > initialization is deffered untill next mastership request.
> > > > > ---
> > > > >  drivers/i3c/device.c       |  26 ++
> > > > >  drivers/i3c/internals.h    |   4 +
> > > > >  drivers/i3c/master.c       | 588 ++++++++++++++++++++++++++++++++++++++-------
> > > > >  include/linux/i3c/master.h |  34 ++-
> > > > >  4 files changed, 563 insertions(+), 89 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > index 69cc040..b60f637 100644
> > > > > --- a/drivers/i3c/device.c
> > > > > +++ b/drivers/i3c/device.c
> > > > > @@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > >  	}
> > > > >  
> > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_bus;
> > > > > +
> > > > >  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> > > > > +
> > > > > +err_unlock_bus:
> > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > >  
> > > > >  	return ret;
> > > > > @@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
> > > > >  	int ret = -ENOENT;
> > > > >  
> > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_bus;
> > > > > +
> > > > >  	if (dev->desc) {
> > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > >  		ret = i3c_dev_enable_ibi_locked(dev->desc);
> > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > >  	}
> > > > > +
> > > > > +err_unlock_bus:
> > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > >  
> > > > >  	return ret;
> > > > > @@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
> > > > >  		return -EINVAL;
> > > > >  
> > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_bus;
> > > > > +
> > > > >  	if (dev->desc) {
> > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > >  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
> > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > >  	}
> > > > > +
> > > > > +err_unlock_bus:
> > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > >  
> > > > >  	return ret;
> > > > > @@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> > > > >   */
> > > > >  void i3c_device_free_ibi(struct i3c_device *dev)
> > > > >  {
> > > > > +	int ret;
> > > > > +
> > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_bus;
> > > > > +
> > > > >  	if (dev->desc) {
> > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > >  		i3c_dev_free_ibi_locked(dev->desc);
> > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > >  	}
> > > > > +
> > > > > +err_unlock_bus:
> > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > index 86b7b44..cdfc5bf 100644
> > > > > --- a/drivers/i3c/internals.h
> > > > > +++ b/drivers/i3c/internals.h
> > > > > @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
> > > > >  
> > > > >  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> > > > >  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> > > > > +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> > > > > +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
> > > > 
> > > > These function are static.
> > > > 
> > > 
> > > I forgot to revert that change to previous state.
> > > 
> > > > > +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> > > > > +
> > > > 
> > > > What do you think to pass this logic to master.c?
> > > > 
> > > 
> > > Isn't it there?
> > 
> > I meant make it static and remove its call from device.c.
> > 
> > > 
> > > > >  
> > > > >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > >  				 struct i3c_priv_xfer *xfers,
> > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > index cbace14..3b44e66 100644
> > > > > --- a/drivers/i3c/master.c
> > > > > +++ b/drivers/i3c/master.c
> > > > > @@ -93,6 +93,18 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> > > > >  	up_read(&bus->lock);
> > > > >  }
> > > > >  
> > > > > +/*
> > > > > + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> > > > > + * operation
> > > > > + *
> > > > > + * Should be called when a maintenance operation is done and normal
> > > > > + * operation is planned. See i3c_bus_maintenance_lock() and
> > > > > + * i3c_bus_normaluse_lock() for more details.
> > > > > + */
> > > > > +static void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> > > > > +{
> > > > > +	downgrade_write(&bus->lock);
> > > > > +}
> > > > >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> > > > >  {
> > > > >  	return container_of(dev, struct i3c_master_controller, dev);
> > > > > @@ -341,6 +353,22 @@ static int i3c_device_probe(struct device *dev)
> > > > >  	return driver->probe(i3cdev);
> > > > >  }
> > > > >  
> > > > > +static int
> > > > > +i3c_master_enable_mr_events_locked(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	if (!master->ops->enable_mr_events)
> > > > > +		return -ENOTSUPP;
> > > > > +
> > > > > +	return master->ops->enable_mr_events(master);
> > > > > +}
> > > > > +
> > > > > +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	if (!master->ops->disable_mr_events)
> > > > > +		return;
> > > > > +
> > > > > +	master->ops->disable_mr_events(master);
> > > > > +}
> > > > 
> > > > Add new line.
> > > > 
> > > > It is not clear to me what you expect with these functions. Do you want 
> > > > to enable MR from all devices? Just some of them? How do you decide which 
> > > > secondary masters are allow earn the bus ownership?
> > > > 
> > > 
> > > We discussed this also. For now, we enable ENEC for all masters on the bus, we
> > > can change it later if needed. 
> > 
> > I would say to expand the current ibi framework to accommodate MR and
> 
> Can you tell something more here? What benefits you see

Just starting with the name. IBI stands for In Band Interrupt which can 
be MR, HJ or SIR.

Also the concept is the same, let say you are registering a SIR w/out 
data but in fact it is a MR. 

> 
> > also add platform entry to allow secondary masters on the bus.
> 
> This is something we can consider, to select devices which can request
> mastership. But I don't see the problem adding that later also.



> 
> > 
> > > Also, priority level is encoded in slave address
> > > so current master will give the control to the master with lower address first.
> > > It shouldn't be a problem.
> > 
> > You can have security issues and the devices on the bus might not be 
> > prepared to work in multi-master environment.
> 
> I don't get it, can you explan what do you mean? Which devices might not be
> prapared to work in multi-master environment, slaves? Key feature of I3C is
> multi-master capability. Mastership request should also be transparent for pure
> slaves on the bus. Of course, secondary masters should work in multi-master
> configuration

So you are probing the same hw device on two different systems. This mean 
that in system A you can have the configuration A and in system B the 
configuration B.
How will you deal with this?

> 
> > 
> > > 
> > > > >  static int i3c_device_remove(struct device *dev)
> > > > >  {
> > > > >  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> > > > > @@ -462,6 +490,42 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static int
> > > > > +i3c_master_request_mastership_locked(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	if (WARN_ON(master->init_done &&
> > > > > +	    !rwsem_is_locked(&master->bus.lock)))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (!master->ops->request_mastership)
> > > > > +		return -ENOTSUPP;
> > > > > +
> > > > > +	return master->ops->request_mastership(master);
> > > > > +}
> > > > > +
> > > > > +static int i3c_master_owns_bus(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	return (master->bus.cur_master == master->this);
> > > > > +}
> > > > > +
> > > > > +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!i3c_master_owns_bus(master)) {
> > > > > +		i3c_bus_normaluse_unlock(&master->bus);
> > > > > +		i3c_bus_maintenance_lock(&master->bus);
> > > > > +
> > > > > +		ret = i3c_master_request_mastership_locked(master);
> > > > > +		if (ret) {
> > > > > +			i3c_bus_maintenance_unlock(&master->bus);
> > > > > +			return ret;
> > > > > +		}
> > > > > +		i3c_bus_downgrade_maintenance_lock(&master->bus);
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > >  static const char * const i3c_bus_mode_strings[] = {
> > > > >  	[I3C_BUS_MODE_PURE] = "pure",
> > > > >  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> > > > > @@ -636,6 +700,22 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
> > > > >  	return dev;
> > > > >  }
> > > > >  
> > > > > +static struct i2c_dev_desc *
> > > > > +i3c_master_alloc_i2c_dev_no_boardinfo(struct i3c_master_controller *master,
> > > > > +				      u16 addr, u8 lvr)
> > > > 
> > > > u8 addr.
> > > > 
> > > 
> > > Originaly I2C address is u16 but we can change it as we know DEFSLVS does not
> > > support 10bit addresses.
> > > 
> > > > > +{
> > > > > +	struct i2c_dev_desc *dev;
> > > > > +
> > > > > +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > > > > +	if (!dev)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	dev->common.master = master;
> > > > > +	dev->addr = addr;
> > > > > +	dev->lvr = lvr;
> > > > > +
> > > > > +	return dev;
> > > > > +}
> > > > >  static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
> > > > >  				   u16 payloadlen)
> > > > >  {
> > > > > @@ -705,6 +785,8 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
> > > > >  	struct i2c_dev_desc *dev;
> > > > >  
> > > > >  	i3c_bus_for_each_i2cdev(&master->bus, dev) {
> > > > > +		if (!dev->boardinfo)
> > > > > +			continue;
> > > > >  		if (dev->boardinfo->base.addr == addr)
> > > > >  			return dev;
> > > > >  	}
> > > > > @@ -1478,7 +1560,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> > > > >  		return;
> > > > >  
> > > > >  	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> > > > > -		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> > > > > +		if (desc->dev || !desc->info.dyn_addr ||
> > > > > +		    desc == master->this || !desc->info.pid)
> > > > >  			continue;
> > > > >  
> > > > >  		desc->dev = kzalloc(sizeof(*desc->dev), GFP_KERNEL);
> > > > > @@ -1504,6 +1587,69 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > +static struct i2c_dev_boardinfo *
> > > > > +i3c_master_find_i2c_boardinfo(const struct i3c_master_controller *master,
> > > > > +			      u16 addr, u8 lvr)
> > > > 
> > > > Same.
> > > > 
> > > 
> > > Same :-)
> > > 
> > > > > +{
> > > > > +	struct i2c_dev_boardinfo *i2cboardinfo;
> > > > > +
> > > > > +	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> > > > > +		if (i2cboardinfo->base.addr == addr &&
> > > > > +		    i2cboardinfo->lvr == lvr)
> > > > > +			return i2cboardinfo;
> > > > > +	}
> > > > > +
> > > > > +	return NULL;
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +i3c_master_register_new_i2c_devs(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
> > > > > +	struct i2c_dev_desc *i2cdev;
> > > > > +
> > > > > +	if (!master->init_done)
> > > > > +		return;
> > > > > +
> > > > > +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> > > > > +
> > > > > +		if (i2cdev->dev)
> > > > > +			continue;
> > > > > +
> > > > > +		if (!i2cdev->boardinfo)
> > > > > +			continue;
> > > > > +
> > > > > +		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> > > > > +					u8 addr)
> > > > > +{
> > > > > +	struct i3c_ccc_getaccmst *accmst;
> > > > > +	struct i3c_ccc_cmd_dest dest;
> > > > > +	struct i3c_ccc_cmd cmd;
> > > > > +	int ret;
> > > > > +
> > > > > +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> > > > > +	if (!accmst)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> > > > > +
> > > > > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> > > > > +	if (ret)
> > > > > +		goto out;
> > > > > +
> > > > > +	if (dest.payload.len != sizeof(*accmst))
> > > > > +		ret = -EIO;
> > > > > +
> > > > > +out:
> > > > > +	i3c_ccc_cmd_dest_cleanup(&dest);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
> > > > >  /**
> > > > >   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> > > > >   * @master: master doing the DAA
> > > > > @@ -1548,10 +1694,6 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
> > > > >  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> > > > > -	    master->secondary)
> > > > > -		return -EINVAL;
> > > > > -
> > > > >  	if (master->this)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > @@ -1560,7 +1702,8 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
> > > > >  		return PTR_ERR(i3cdev);
> > > > >  
> > > > >  	master->this = i3cdev;
> > > > > -	master->bus.cur_master = master->this;
> > > > > +	if (!secondary)
> > > > > +		master->bus.cur_master = master->this;
> > > > >  
> > > > >  	ret = i3c_master_attach_i3c_dev(master, i3cdev);
> > > > >  	if (ret)
> > > > > @@ -1601,37 +1744,7 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > -/**
> > > > > - * i3c_master_bus_init() - initialize an I3C bus
> > > > > - * @master: main master initializing the bus
> > > > > - *
> > > > > - * This function is following all initialisation steps described in the I3C
> > > > > - * specification:
> > > > > - *
> > > > > - * 1. Attach I2C and statically defined I3C devs to the master so that the
> > > > > - *    master can fill its internal device table appropriately
> > > > > - *
> > > > > - * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> > > > > - *    the master controller. That's usually where the bus mode is selected
> > > > > - *    (pure bus or mixed fast/slow bus)
> > > > > - *
> > > > > - * 3. Instruct all devices on the bus to drop their dynamic address. This is
> > > > > - *    particularly important when the bus was previously configured by someone
> > > > > - *    else (for example the bootloader)
> > > > > - *
> > > > > - * 4. Disable all slave events.
> > > > > - *
> > > > > - * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> > > > > - *    devices that have a static address
> > > > > - *
> > > > > - * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> > > > > - *    remaining I3C devices
> > > > > - *
> > > > > - * Once this is done, all I3C and I2C devices should be usable.
> > > > > - *
> > > > > - * Return: a 0 in case of success, an negative error code otherwise.
> > > > > - */
> > > > > -static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > > > +static int i3c_master_attach_static_devs(struct i3c_master_controller *master)
> > > > >  {
> > > > >  	enum i3c_addr_slot_status status;
> > > > >  	struct i2c_dev_boardinfo *i2cboardinfo;
> > > > > @@ -1640,32 +1753,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > > >  	struct i2c_dev_desc *i2cdev;
> > > > >  	int ret;
> > > > >  
> > > > > -	/*
> > > > > -	 * First attach all devices with static definitions provided by the
> > > > > -	 * FW.
> > > > > -	 */
> > > > >  	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> > > > >  		status = i3c_bus_get_addr_slot_status(&master->bus,
> > > > >  						      i2cboardinfo->base.addr);
> > > > > -		if (status != I3C_ADDR_SLOT_FREE) {
> > > > > -			ret = -EBUSY;
> > > > > -			goto err_detach_devs;
> > > > > -		}
> > > > > +		if (status != I3C_ADDR_SLOT_FREE)
> > > > > +			return -EBUSY;
> > > > >  
> > > > >  		i3c_bus_set_addr_slot_status(&master->bus,
> > > > >  					     i2cboardinfo->base.addr,
> > > > >  					     I3C_ADDR_SLOT_I2C_DEV);
> > > > >  
> > > > >  		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
> > > > > -		if (IS_ERR(i2cdev)) {
> > > > > -			ret = PTR_ERR(i2cdev);
> > > > > -			goto err_detach_devs;
> > > > > -		}
> > > > > +		if (IS_ERR(i2cdev))
> > > > > +			return PTR_ERR(i2cdev);
> > > > >  
> > > > >  		ret = i3c_master_attach_i2c_dev(master, i2cdev);
> > > > >  		if (ret) {
> > > > >  			i3c_master_free_i2c_dev(i2cdev);
> > > > > -			goto err_detach_devs;
> > > > > +			return ret;
> > > > >  		}
> > > > >  	}
> > > > >  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > > > > @@ -1676,27 +1781,68 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > > >  		if (i3cboardinfo->init_dyn_addr) {
> > > > >  			status = i3c_bus_get_addr_slot_status(&master->bus,
> > > > >  						i3cboardinfo->init_dyn_addr);
> > > > > -			if (status != I3C_ADDR_SLOT_FREE) {
> > > > > -				ret = -EBUSY;
> > > > > -				goto err_detach_devs;
> > > > > -			}
> > > > > +			if (status != I3C_ADDR_SLOT_FREE)
> > > > > +				return -EBUSY;
> > > > >  		}
> > > > >  
> > > > >  		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > > > > -		if (IS_ERR(i3cdev)) {
> > > > > -			ret = PTR_ERR(i3cdev);
> > > > > -			goto err_detach_devs;
> > > > > -		}
> > > > > +		if (IS_ERR(i3cdev))
> > > > > +			return PTR_ERR(i3cdev);
> > > > >  
> > > > >  		i3cdev->boardinfo = i3cboardinfo;
> > > > >  
> > > > >  		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> > > > >  		if (ret) {
> > > > >  			i3c_master_free_i3c_dev(i3cdev);
> > > > > -			goto err_detach_devs;
> > > > > +			return ret;
> > > > >  		}
> > > > >  	}
> > > > >  
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * i3c_master_bus_init() - initialize an I3C bus
> > > > > + * @master: main master initializing the bus
> > > > > + *
> > > > > + * This function is following all initialisation steps described in the I3C
> > > > > + * specification:
> > > > > + *
> > > > > + * 1. Attach I2C and statically defined I3C devs to the master so that the
> > > > > + *    master can fill its internal device table appropriately
> > > > > + *
> > > > > + * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> > > > > + *    the master controller. That's usually where the bus mode is selected
> > > > > + *    (pure bus or mixed fast/slow bus)
> > > > > + *
> > > > > + * 3. Instruct all devices on the bus to drop their dynamic address. This is
> > > > > + *    particularly important when the bus was previously configured by someone
> > > > > + *    else (for example the bootloader)
> > > > > + *
> > > > > + * 4. Disable all slave events.
> > > > > + *
> > > > > + * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> > > > > + *    devices that have a static address
> > > > > + *
> > > > > + * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> > > > > + *    remaining I3C devices
> > > > > + *
> > > > > + * Once this is done, all I3C and I2C devices should be usable.
> > > > > + *
> > > > > + * Return: a 0 in case of success, an negative error code otherwise.
> > > > > + */
> > > > > +static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	struct i3c_dev_desc *i3cdev;
> > > > > +	int ret;
> > > > > +
> > > > > +	/*
> > > > > +	 * First attach all devices with static definitions provided by the
> > > > > +	 * FW.
> > > > > +	 */
> > > > > +	ret = i3c_master_attach_static_devs(master);
> > > > > +	if (ret)
> > > > > +		goto err_detach_devs;
> > > > >  	/*
> > > > >  	 * Now execute the controller specific ->bus_init() routine, which
> > > > >  	 * might configure its internal logic to match the bus limitations.
> > > > > @@ -1780,45 +1926,76 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > - * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> > > > > - * @master: master used to send frames on the bus
> > > > > - * @addr: I3C slave dynamic address assigned to the device
> > > > > + * i3c_master_add_i2c_dev_locked() - add an I2C slave to the bus
> > > > > + * @master: master used to register I2C device
> > > > > + * @addr: I2C device address
> > > > > + * @lvr: legacy virtual register value
> > > > >   *
> > > > > - * This function is instantiating an I3C device object and adding it to the
> > > > > - * I3C device list. All device information are automatically retrieved using
> > > > > - * standard CCC commands.
> > > > > - *
> > > > > - * The I3C device object is returned in case the master wants to attach
> > > > > - * private data to it using i3c_dev_set_master_data().
> > > > > + * This function is instantiating an I2C device object and adding it to the
> > > > > + * I2C device list.
> > > > >   *
> > > > >   * This function must be called with the bus lock held in write mode.
> > > > >   *
> > > > >   * Return: a 0 in case of success, an negative error code otherwise.
> > > > >   */
> > > > > -int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > > > > -				  u8 addr)
> > > > > +int i3c_master_add_i2c_dev_locked(struct i3c_master_controller *master,
> > > > > +				  u16 addr, u8 lvr)
> > > > >  {
> > > > > -	struct i3c_device_info info = { .dyn_addr = addr };
> > > > > -	struct i3c_dev_desc *newdev, *olddev;
> > > > > -	u8 old_dyn_addr = addr, expected_dyn_addr;
> > > > > -	struct i3c_ibi_setup ibireq = { };
> > > > > -	bool enable_ibi = false;
> > > > > +	enum i3c_addr_slot_status status;
> > > > > +	struct i2c_dev_desc *i2cdev;
> > > > >  	int ret;
> > > > >  
> > > > >  	if (!master)
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	newdev = i3c_master_alloc_i3c_dev(master, &info);
> > > > > -	if (IS_ERR(newdev))
> > > > > -		return PTR_ERR(newdev);
> > > > > +	status = i3c_bus_get_addr_slot_status(&master->bus,
> > > > > +					      addr);
> > > > > +	if (status != I3C_ADDR_SLOT_FREE)
> > > > > +		return -EBUSY;
> > > > >  
> > > > > -	ret = i3c_master_attach_i3c_dev(master, newdev);
> > > > > -	if (ret)
> > > > > +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> > > > > +				     I3C_ADDR_SLOT_I2C_DEV);
> > > > > +
> > > > > +	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
> > > > > +
> > > > > +	if (IS_ERR(i2cdev)) {
> > > > > +		ret = PTR_ERR(i2cdev);
> > > > > +		goto err_free_dev;
> > > > > +	}
> > > > > +
> > > > > +	i2cdev->boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
> > > > > +
> > > > > +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> > > > > +
> > > > > +	if (ret) {
> > > > > +		ret = PTR_ERR(i2cdev);
> > > > >  		goto err_free_dev;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_free_dev:
> > > > > +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> > > > > +				     I3C_ADDR_SLOT_FREE);
> > > > > +	i3c_master_free_i2c_dev(i2cdev);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev_locked);
> > > > > +
> > > > > +static int
> > > > > +i3c_master_retrieve_info_and_reuse(struct i3c_master_controller *master,
> > > > > +				   struct i3c_dev_desc *newdev)
> > > > > +{
> > > > > +	struct i3c_dev_desc *olddev;
> > > > > +	u8 old_dyn_addr = newdev->info.dyn_addr, expected_dyn_addr;
> > > > > +	struct i3c_ibi_setup ibireq = { };
> > > > > +	bool enable_ibi = false;
> > > > > +	int ret;
> > > > >  
> > > > >  	ret = i3c_master_retrieve_dev_info(newdev);
> > > > >  	if (ret)
> > > > > -		goto err_detach_dev;
> > > > > +		return ret;
> > > > >  
> > > > >  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
> > > > >  	if (olddev) {
> > > > > @@ -1857,7 +2034,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > > > >  
> > > > >  	ret = i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> > > > >  	if (ret)
> > > > > -		goto err_detach_dev;
> > > > > +		return ret;
> > > > >  
> > > > >  	/*
> > > > >  	 * Depending on our previous state, the expected dynamic address might
> > > > > @@ -1920,6 +2097,50 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > > > >  	}
> > > > >  
> > > > >  	return 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> > > > > + * @master: master used to send frames on the bus
> > > > > + * @addr: I3C slave dynamic address assigned to the device
> > > > > + *
> > > > > + * This function is instantiating an I3C device object and adding it to the
> > > > > + * I3C device list. All device information are automatically retrieved using
> > > > > + * standard CCC commands.
> > > > > + *
> > > > > + * The I3C device object is returned in case the master wants to attach
> > > > > + * private data to it using i3c_dev_set_master_data().
> > > > > + *
> > > > > + * This function must be called with the bus lock held in write mode.
> > > > > + *
> > > > > + * Return: a 0 in case of success, an negative error code otherwise.
> > > > > + */
> > > > > +int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > > > > +				  u8 addr)
> > > > > +{
> > > > > +	struct i3c_device_info info = { .dyn_addr = addr };
> > > > > +	struct i3c_dev_desc *newdev;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!master)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	newdev = i3c_master_alloc_i3c_dev(master, &info);
> > > > > +	if (IS_ERR(newdev))
> > > > > +		return PTR_ERR(newdev);
> > > > > +
> > > > > +	ret = i3c_master_attach_i3c_dev(master, newdev);
> > > > > +	if (ret)
> > > > > +		goto err_free_dev;
> > > > > +
> > > > > +	if (i3c_master_owns_bus(master)) {
> > > > > +		ret = i3c_master_retrieve_info_and_reuse(master, newdev);
> > > > > +		if (ret)
> > > > > +			goto err_detach_dev;
> > > > > +	} else
> > > > > +		master->want_to_acquire_bus = true;
> > > > > +
> > > > > +	return 0;
> > > > >  
> > > > >  err_detach_dev:
> > > > >  	if (newdev->dev && newdev->dev->desc)
> > > > > @@ -2101,11 +2322,15 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> > > > >  	}
> > > > >  
> > > > >  	i3c_bus_normaluse_lock(&master->bus);
> > > > > +	ret = i3c_master_acquire_bus_ownership(master);
> > > > > +	if (ret)
> > > > > +		goto err_unlock_bus;
> > > > >  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
> > > > >  	if (!dev)
> > > > >  		ret = -ENOENT;
> > > > >  	else
> > > > >  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> > > > > +err_unlock_bus:
> > > > >  	i3c_bus_normaluse_unlock(&master->bus);
> > > > >  
> > > > >  	return ret ? ret : nxfers;
> > > > > @@ -2144,9 +2369,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> > > > >  	 * We silently ignore failures here. The bus should keep working
> > > > >  	 * correctly even if one or more i2c devices are not registered.
> > > > >  	 */
> > > > > -	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
> > > > > +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> > > > > +		if (!i2cdev->boardinfo)
> > > > > +			continue;
> > > > >  		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> > > > >  
> > > > > +	}
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > @@ -2385,9 +2613,76 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
> > > > >  	     !ops->recycle_ibi_slot))
> > > > >  		return -EINVAL;
> > > > >  
> > > > > +	/*
> > > > > +	 * If mastership request is supported, we also need hooks to control
> > > > > +	 * when mastership request can occur by enabling/disabling the event.
> > > > > +	 */
> > > > > +	if (ops->request_mastership &&
> > > > > +	    (!ops->enable_mr_events || !ops->disable_mr_events))
> > > > > +		return -EINVAL;
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static void i3c_master_register_new_devs(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	/*
> > > > > +	 * We can register devices received from master by DEFSLVS.
> > > > > +	 */
> > > > > +	i3c_bus_normaluse_lock(&master->bus);
> > > > > +	i3c_master_register_new_i3c_devs(master);
> > > > > +	i3c_master_register_new_i2c_devs(master);
> > > > > +	i3c_bus_normaluse_unlock(&master->bus);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> > > > > + * @master: master used to send frames on the bus
> > > > > + *
> > > > > + * This function is useful when devices were not added
> > > > > + * during initialization or when new device joined the bus
> > > > > + * which wasn't under our control.
> > > > > + */
> > > > > +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> > > > > +{
> > > > > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> > > > > +	int ret;
> > > > > +
> > > > > +	master->want_to_acquire_bus = false;
> > > > 
> > > > Can you explain the usage of this variable?
> > > > 
> > > 
> > > The idea of this was to let HC know that we want to acquire the bus after
> > > ENEC(MR) received in slave mode.
> > 
> > With the logic that I proposed you don't need this. When received ENEC 
> > you will try to get the bus ownership if HC not fully initialized or have 
> > DEFSLVS to add, otherwise you don't need to get the bus ownership.
> 
> In case devices on the bus are the same, I agree. But please consider the case
> when slave joins the bus (Hot-Join) and MR event is disabled for now, our
> secondary master receives DEFSLVS, we add that device to the subsystem but
> cannot request mastership yet. We need a flag to indicate that we should
> request mastership on next ENEC(MR). It doesn't make sense to request
> mastership every time when ENEC(MR) is received.

At least I think you can give a mean for the flag name, otherwise it is 
not clear why sec master want bus ownership.

> 
> > 
> > > 
> > > > > +
> > > > > +	if (!master->init_done)
> > > > > +		return;
> > > > > +
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	master->ops->populate_bus(master);
> > > > > +
> > > > > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > > > > +				 common.node) {
> > > > > +		if (i3cdev->info.pid)
> > > > > +			continue;
> > > > > +
> > > > > +		ret = i3c_master_retrieve_info_and_reuse(master, i3cdev);
> > > > > +		if (ret) {
> > > > > +			if (i3cdev->dev && i3cdev->dev->desc)
> > > > > +				i3cdev->dev->desc = NULL;
> > > > > +
> > > > > +			i3c_master_detach_i3c_dev(i3cdev);
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * If current master finished bus initialization properly, we can
> > > > > +	 * enable Mastership event.
> > > > > +	 */
> > > > > +	ret = i3c_master_enable_mr_events_locked(master);
> > > > > +	if (ret)
> > > > > +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> > > > > +
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > +
> > > > > +	i3c_master_register_new_devs(master);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
> > > > > +
> > > > >  /**
> > > > >   * i3c_master_init() - initializes all the structures required by I3C master
> > > > >   * @master: master used to send frames on the bus
> > > > > @@ -2417,9 +2712,6 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > > >  	int ret;
> > > > >  
> > > > > -	/* We do not support secondary masters yet. */
> > > > > -	if (secondary)
> > > > > -		return -ENOTSUPP;
> > > > >  
> > > > >  	ret = i3c_master_check_ops(ops);
> > > > >  	if (ret)
> > > > > @@ -2432,6 +2724,7 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > >  	master->dev.release = i3c_masterdev_release;
> > > > >  	master->ops = ops;
> > > > >  	master->secondary = secondary;
> > > > > +	master->want_to_acquire_bus = secondary;
> > > > >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> > > > >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> > > > >  
> > > > > @@ -2488,6 +2781,92 @@ void i3c_master_cleanup(struct i3c_master_controller *master)
> > > > >  EXPORT_SYMBOL_GPL(i3c_master_cleanup);
> > > > >  
> > > > >  /**
> > > > > + * i3c_secondary_master_register() - register an secondary I3C master
> > > > > + * @master: master used to send frames on the bus
> > > > > + * @info: master info, describes this device
> > > > > + *
> > > > > + * This function takes care of everything for you:
> > > > > + *
> > > > > + * - updates this master info
> > > > > + * - registers the I2C adapter
> > > > > + * - if possible, populates the bus with devices received by DEFSLVS
> > > > > + *   command
> > > > > + *
> > > > > + * Return: 0 in case of success, a negative error code otherwise.
> > > > > + */
> > > > > +int i3c_secondary_master_register(struct i3c_master_controller *master,
> > > > > +				  struct i3c_device_info *info)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = i3c_master_set_info(master, info, master->secondary);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = master->ops->bus_init(master);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > 
> > > > At this point you don't have enough information to do the bus 
> > > > initialization.
> > > > 
> > > 
> > > Actually, current ->bus_init() implementations (in CDNS and DW) does not
> > > initialize the bus. We are just setting the mode, configuring some init values
> > > in the registers and enabling the core. Maybe we should rename it?
> > 
> > The name for me its ok. My point was that when you call 
> > i3c_secondary_master_register() in CDNS you don't have yet DEFSLVS 
> > information.
> 
> It depends. When current master did not initialize the bus yet, this is true.
> But when master and the bus are already initialized, I have DEFSLVS. Different
> story is that devices aren't added to the subsystem yet. So what I have do in
> that case is to enable to let HC operate and populate the bus later (using
> ->populate_bus() hook)

Ahh I didn't see, you are calling it in two different places. Does it 
make sense?

It is more logical to do the secondary_master_register() after get the 
bus ownership (just need the first time), otherwise the HC is just a 
slave.

> 
> > 
> > > 
> > > > > +
> > > > > +	ret = device_add(&master->dev);
> > > > > +	if (ret)
> > > > > +		return -1;
> > > > > +
> > > > > +	/*
> > > > > +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> > > > > +	 * through the I2C subsystem.
> > > > > +	 */
> > > > > +	ret = i3c_master_i2c_adapter_init(master);
> > > > > +	if (ret)
> > > > > +		goto err_del_dev;
> > > > > +
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	/*
> > > > > +	 * If possible, request mastership and try to populate the bus.
> > > > > +	 */
> > > > > +	ret = i3c_master_request_mastership_locked(master);
> > > > > +	if (ret)
> > > > > +		dev_warn(&master->dev,
> > > > > +			 "Mastership failed at init time (ret = %i)", ret);
> > > > > +
> > > > > +	/*
> > > > > +	 * No matter if mastership takeover passed or not, add partialy
> > > > > +	 * discovered devices. We can register them when ENEC(MR) is enabled.
> > > > > +	 */
> > > > > +	master->ops->populate_bus(master);
> > > > > +
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > +
> > > > > +	/*
> > > > > +	 * We're done initializing the bus and the controller, we can now
> > > > > +	 * register I3C devices obtained by DEFSLVS.
> > > > > +	 */
> > > > > +	master->init_done = true;
> > > > > +	i3c_master_register_new_devs(master);
> > > > > +
> > > > > +	/*
> > > > > +	 * If we are owning the bus, enable ENEC(MR) to let other masters
> > > > > +	 * initialize their bus.
> > > > > +	 */
> > > > > +	if (i3c_master_owns_bus(master)) {
> > > > > +		i3c_bus_maintenance_lock(&master->bus);
> > > > > +		ret = i3c_master_enable_mr_events_locked(master);
> > > > > +		i3c_bus_maintenance_unlock(&master->bus);
> > > > > +		if (ret)
> > > > > +			dev_warn(&master->dev,
> > > > > +				 "ENEC(MR) failed (ret = %i)", ret);
> > > > > +	}
> > > > > +
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_del_dev:
> > > > > +	device_del(&master->dev);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(i3c_secondary_master_register);
> > > > > +
> > > > > +/**
> > > > >   * i3c_master_register() - register an primary I3C master
> > > > >   * @master: master used to send frames on the bus
> > > > >   * @info: master info, describes this device
> > > > > @@ -2509,7 +2888,6 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > >  	ret = i3c_master_set_info(master, info, master->secondary);
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > > -
> > > > >  	ret = i3c_master_bus_init(master);
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > > @@ -2535,6 +2913,16 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > >  	i3c_master_register_new_i3c_devs(master);
> > > > >  	i3c_bus_normaluse_unlock(&master->bus);
> > > > >  
> > > > > +	/*
> > > > > +	 * Enable ENEC(MR) and let other masters request mastership
> > > > > +	 * and initialize their bus.
> > > > > +	 */
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	ret = i3c_master_enable_mr_events_locked(master);
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > +	if (ret)
> > > > > +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> > > > > +
> > > > >  	return 0;
> > > > >  
> > > > >  err_del_dev:
> > > > > @@ -2548,6 +2936,29 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > >  
> > > > >  /**
> > > > > + * i3c_master_mastership_ack() - acknowledges bus takeover.
> > > > > + * @master: master used to send frames on the bus
> > > > > + * @addr: I3C device address
> > > > > + *
> > > > > + * This function acknowledges bus takeover.
> > > > > + *
> > > > > + * Return: 0 in case of success, a negative error code otherwise.
> > > > > + */
> > > > > +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> > > > > +			      u8 addr)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	ret = i3c_master_get_accmst_locked(master, addr);
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> > > > > +
> > > > > +
> > > > > +/**
> > > > >   * i3c_master_unregister() - unregister an I3C master
> > > > >   * @master: master used to send frames on the bus
> > > > >   *
> > > > > @@ -2557,6 +2968,9 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > >   */
> > > > >  int i3c_master_unregister(struct i3c_master_controller *master)
> > > > >  {
> > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > +	i3c_master_disable_mr_events(master);
> > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > >  	i3c_master_i2c_adapter_cleanup(master);
> > > > >  	i3c_master_unregister_i3c_devs(master);
> > > > >  	i3c_master_bus_cleanup(master);
> > > > > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > > > > index e089771..6ac9b46 100644
> > > > > --- a/include/linux/i3c/master.h
> > > > > +++ b/include/linux/i3c/master.h
> > > > > @@ -421,6 +421,26 @@ struct i3c_bus {
> > > > >   *		      for a future IBI
> > > > >   *		      This method is mandatory only if ->request_ibi is not
> > > > >   *		      NULL.
> > > > > + * @request_mastership: requests bus mastership. Mastership is requested
> > > > > + *                      automatically when device driver wants to transfer
> > > > > + *                      data using a master that does not currently
> > > > > + *                      owns the bus.
> > > > > + * @enable_mr_events: enable the Mastership event. Master driver can prepare
> > > > > + *                    its internal state to be ready for incoming mastership
> > > > > + *                    requests and then should send ENEC(MR) command to let
> > > > > + *                    other masters take control over the bus.
> > > > > + * @disable_mr_events: disable the Mastership event. Master driver should
> > > > > + *                     immediately send DISEC(MR) command and can perform other
> > > > > + *                     operations. For example, recycle IBI slot if used before
> > > > > + *                     for MR event.
> > > > > + * @populate_pus: populates the bus. Called after bus takeover. Secondary
> > > > > + *                master can't perform DAA procedure. This function allows to
> > > > > + *                update devices received from previous bus owner in DEFSLVS
> > > > > + *                command. Useful also when new device joins the bus controlled
> > > > > + *                by secondary master, main master will be able to add
> > > > > + *                this device after mastership takeover. Driver should also
> > > > > + *		  update bus mode when I2C device is on the bus.
> > > > > + *
> > > > >   */
> > > > >  struct i3c_master_controller_ops {
> > > > >  	int (*bus_init)(struct i3c_master_controller *master);
> > > > > @@ -447,6 +467,10 @@ struct i3c_master_controller_ops {
> > > > >  	int (*disable_ibi)(struct i3c_dev_desc *dev);
> > > > >  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
> > > > >  				 struct i3c_ibi_slot *slot);
> > > > > +	int (*request_mastership)(struct i3c_master_controller *master);
> > > > > +	int (*enable_mr_events)(struct i3c_master_controller *master);
> > > > > +	int (*disable_mr_events)(struct i3c_master_controller *master);
> > > > > +	int (*populate_bus)(struct i3c_master_controller *master);
> > > > >  };
> > > > >  
> > > > >  /**
> > > > > @@ -488,6 +512,7 @@ struct i3c_master_controller {
> > > > >  	} boardinfo;
> > > > >  	struct i3c_bus bus;
> > > > >  	struct workqueue_struct *wq;
> > > > > +	bool want_to_acquire_bus;
> > > > >  };
> > > > >  
> > > > >  /**
> > > > > @@ -526,6 +551,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
> > > > >  int i3c_master_get_free_addr(struct i3c_master_controller *master,
> > > > >  			     u8 start_addr);
> > > > >  
> > > > > +int i3c_master_add_i2c_dev_locked(struct i3c_master_controller *master,
> > > > > +				  u16 addr, u8 lvr);
> > > > >  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > > > >  				  u8 addr);
> > > > >  int i3c_master_do_daa(struct i3c_master_controller *master);
> > > > > @@ -535,9 +562,14 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > >  		    const struct i3c_master_controller_ops *ops,
> > > > >  		    bool secondary);
> > > > >  void i3c_master_cleanup(struct i3c_master_controller *master);
> > > > > +int i3c_secondary_master_register(struct i3c_master_controller *master,
> > > > > +				  struct i3c_device_info *info);
> > > > >  int i3c_master_register(struct i3c_master_controller *master,
> > > > >  			struct i3c_device_info *info);
> > > > >  int i3c_master_unregister(struct i3c_master_controller *master);
> > > > > +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> > > > > +			      u8 addr);
> > > > > +void i3c_master_bus_takeover(struct i3c_master_controller *master);
> > > > >  int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode);
> > > > >  
> > > > >  /**
> > > > > @@ -648,7 +680,5 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
> > > > >  
> > > > >  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
> > > > >  
> > > > > -void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> > > > > -void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
> > > > >  
> > > > >  #endif /* I3C_MASTER_H */
> > > > > -- 
> > > > > 2.4.5
> > > > 
> > > > In generally I found this intrusive for the current eco system.
> > > > 
> > > > I propose the following:
> > > > 1 - Keep the function i3c_master_register() as is and go out before 
> > > 
> > > We had that version previously. We decided to split it.
> > 
> > You just need to split the secondary master part from it. So you can go 
> > out before i3c_master_bus_init() and keep the same function.
> 
> We discussed that with Boris and we decided to split this function in this
> version to make things clear.

My proposal isn't to much different with the advantage that it not broke 
the existing code.

> 
> > 
> > Them use i3c_secondary_master_register() when received DEFSLVS or ENEC 
> > MR.
> 
> It is also possible that our controller received DA and DEFSLVS even before
> master registration. We should try to register that, this is something I'm
> testing in my scenarios.

That shouldn't be a problem. You receive DA and them DEFSLVS.

Add DEFSLVS to the system and try to be current master.

If you get the ownership, do:
	i3c_secondary_master_register()
	retrieve defslvs info and add them to the system.

After this you will see everything in /sys/bus/i3c/devices

If you don't get the ownership, it is ok because HC is just a slave.

I would try to da all management task in subsystem.

> 
> > 
> > > 
> > > > i3c_master_bus_init() if secondary master.
> > > > @Boris Brezillon is it possible to replace device_initialize() device_add() with device_register()?
> > > > 
> > > > 2 - When received DEFSLVS commands add devices to a link list like 
> > > > boardinfo.
> > > 
> > > If DEFSLVS received devices are partialy added at init time.
> > > 
> > > >   Get bus ownership if there is DEFSLVS to add or secondary master not 
> > > > initialized. 
> > > > 
> > > > 3 - When received ENEC MR
> > > 
> > > I thought it works like that :-) When ENEC(MR) received, HC driver adds devices
> > > from DEFSLVS frame,
> > 
> > Yes, but in your case the logic is in HC. Let the subsystem do that task 
> > when you switch the role.
> > I think you did that in v1 or v2.
> 
> True, but we also decided to do this in HC. We didn't want to standardize events
> yet.
> 
> > 
> > > 
> > > >   Get bus ownership if there is DEFSLVS to add or secondary master not 
> > > > initialized.
> > > > 
> > > > 4 - When secondary master became current master.
> > > 
> > > and calls i3c_master_bus_takeover() to let subsystem gather device information
> > > and register them.
> > 
> > It  is not clear to me if it is already the current master.
> 
> Bus takeover should be performed right after we got the control over the bus. I
> don't know how to make is simpler.

Maybe I have to recheck this part.

> 
> > 
> > > 
> > > >   Attach new devices to the host controller and retrieve device info 
> > > > (same logic as in i3c_master_add_i3c_dev_locked).
> > > > 
> > > > With this approach on HC side you just need to add the secondary master 
> > > > stuff without changing the current code and leave for the subsystem the 
> > > > responsible to manage all these secondary master task.
> > > 
> > > This may be difficult for some controllers, depends where DEFSLVS device
> > > information is stored.
> > 
> > That is the main reason I want pass DEFSLVS to a list in the subsystem.
> > I think it will be common to everyone receive a notification that DEFSLVS 
> > arrived.
> 
> As I said before, I'm not sure if this is good idea or not. We are registering
> the devices in HC drivers after DAA using i3c_master_add_i3c_dev_locked() and
> this isn't the issue. I wonder why it could be the problem here. The
> difference here is only the source of the devices, not DAA but DEFSLVS.

It is different because when you received the DEFSLVS the HC isn't the 
current master.

> 
> > 
> > > I also cannot find information about that part in
> > > MIPI I3C HCI specification. This part can be vendor specific. What do you
> > > think?
> > 
> > It is not defined int v1.0
> 
> I see now that HCI spec does not cover secondary master functionality at all.
> 
> > 
> > > 
> > > > 
> > > > Let me know if this works for you.
> > > > 
> > > > 
> > > > Best regards,
> > > > Vitor Soares
> > > 
> > > -- 
> > > -- 
> > > Przemyslaw Gaj
> > 
> > Best regards,
> > Vitor Soares
> > 
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
