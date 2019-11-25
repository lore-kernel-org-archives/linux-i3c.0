Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F265C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438E32082F
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBzCyrXh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a2WIBTBE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="drEgs30k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 438E32082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxMb+v7tkzftH9sE0apbTA+mb4nMiMsCNQCKYhbBFvE=; b=XBzCyrXhkpP15N
	qIj+62fsBGwYpsp0UUzddggtvzEH+KqL2UKiODFSsSCcsES203Tjx2nqTdoj2JNiPvowikkr7dfJm
	UCG1UkChQJjgpzMTph0X23fZpfO/OuGcM7JuTRRH6gYYQgGNNVVIXUt5v6M/kRLSbUe7MJED/rW4X
	pQO9vEMIFOVpMSEROz0XDdUaJmHGMhH5ZHAfKtF7t51l8rmSM8htB5fTzt5e3jCE0l3/i/oyoEIFL
	G5l4JTf+xV7yYqA32JEyIaPSAlGawHycshyA4cFBxM5VKEUN4dUZD5iOHSNc55lF3N3eXOfrjcyWp
	Pi4Es7h6wVsvqGQdr/+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDv3-0004wI-Vv; Mon, 25 Nov 2019 12:56:45 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDv1-0004vo-1L
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 12:56:44 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13E45C2525;
 Mon, 25 Nov 2019 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574686602; bh=OGx870Qx3m+ipTZ3SylCAI4huAG8Q1fav+p0/+q3NNk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=a2WIBTBER4PIghuekb0D+BETGaWYsmbyJWLK1rvwHjqJ9PC30tRevaMjsk1oJVMZa
 wDNbNszo7/Y0Wz5hx4YSoMVFufPW5Hmf4JSAqk8pTWABa55Ngz+7ywD6jbSLZuBSEA
 aLedoaE0pJsjaCCPcwXiYcxUaaKiwcppXIcB6GhIyeafin5GSsvuCXAHXnyAQtf7q7
 Oqiyhgnt5EG1SUAyLgtCbGYVFULIErlq+cstmzFvtuaV2zqMoMSEiQGjwJag/s/CeK
 vEpyaMhEFV6KPP/QJXaHsYpn/cMc4sFFK8BonbcfeT74SZ5J5qzOmzSW7qdqrdiTeN
 GgnJ+zibaW2gQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id F1899A006B;
 Mon, 25 Nov 2019 12:56:40 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 04:56:40 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 04:56:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUOf/Y3gTP2o8jOPrCDZ97F1bI/RCsxT/XgVwS9savPojWAPOUscSd9BwEWQS1r5VaU0Aogwl3Jw/HuVG4Bb7WeZ2Onh5jzqWPRdj01TT6KlYuIL+XYXnsCsJ1rTKCv1sAQWaIDWXDyqcWMGIvUJA2xyc3kl+r588B6M4up0fbjHIEcibaamwxqSJYzGQZTNk2vw86urxee9NelItGZlNhAA18ciQXZtPsrR0v/LqowedyjCkaKMxGud++3dqEtJLfrlB2nUHSt+WXPNZzKnbdfUVi+0nimK8s0LWQ3rvU6ngR1Wgs5q2MB7plmQhJ0/5WBnmjUQotDFIY0Ze8+5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGx870Qx3m+ipTZ3SylCAI4huAG8Q1fav+p0/+q3NNk=;
 b=YW9f4Auwg0yrZ2dYLgZAS910EY2JGgOj5AsjUsASulogj1d6Y2M3bZmnZ7bWVtyXEz9HIdb3bsz71NgkjFtXWTuW5uk2vxVOJ/IWJTg7iypixEW94gFOSxJdrKhvaYYKyYW5gZxu1VOJUoWtoXmfbFJdO+H48mGkZCx7GPLdJeu8SJg0MBNc6KiEHqrG2R7C4iFRUov1srhdc1K/Kt3e4W9xQvOAuiGj4oZXn6LYCJjS/LPq/IGvS9qQOuvNGQZ+WPu2UAnKuhDGfdCUFKZIJodaPPIjeFlOE/YyBIxWKxmuyNuW2vpapSPYGQkbFf538CPcOIZiWuTtBpjXT/5QPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGx870Qx3m+ipTZ3SylCAI4huAG8Q1fav+p0/+q3NNk=;
 b=drEgs30kXQ44GiZ7dxVbRTx/CnmXuHNIzCtdfxF4S6cUxlIbH3BFO1YszfrsgSQPKqnzW6+tMq9HnwxylbXVVM5GZrQhQamFJ+OBse6m6GS5auVq1Pn9tqrRbDkMUAIOQax0pW1MBw5RXNl5YpaPocCp3YsFfT5/W3lK4gxv/Ks=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4229.namprd12.prod.outlook.com (20.180.5.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Mon, 25 Nov 2019 12:56:38 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 12:56:38 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVCAAAUuAIAAARUggAAHVYCAAAZIAA==
Date: Mon, 25 Nov 2019 12:56:38 +0000
Message-ID: <CH2PR12MB42163038A72A7C5DE7A520E2AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125122522.GB5777@global.cadence.com>
In-Reply-To: <20191125122522.GB5777@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNREZqWXpjNFpqRXRNR1k0TXkweE1XVmhMVGd5TmpndFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYREF4WTJNM09HWXlMVEJtT0RNdE1URmxZ?=
 =?utf-8?B?UzA0TWpZNExXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5U?=
 =?utf-8?B?QTFOaUlnZEQwaU1UTXlNVGt4TmpBeE9UWTNORGsyTWpZeElpQm9QU0pOZGxO?=
 =?utf-8?B?MmJVRlZkWE15WnpGcFJWaDNhMGdyUW1adVRXVjFkekE5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUpHTDBrdlJtbzJVRlpCWmtORVRISlRWR0ozZUU0NFNV?=
 =?utf-8?B?MTFkRXBPZGtSRk1FOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 2d21b871-492e-4715-12fb-08d771a6e955
x-ms-traffictypediagnostic: CH2PR12MB4229:
x-microsoft-antispam-prvs: <CH2PR12MB42294C290C5D4E7F2169C2DBAE4A0@CH2PR12MB4229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(366004)(136003)(346002)(43544003)(199004)(189003)(6506007)(74316002)(5660300002)(4326008)(25786009)(11346002)(81166006)(66476007)(14454004)(99286004)(186003)(8936002)(6246003)(256004)(33656002)(14444005)(9686003)(86362001)(52536014)(76176011)(66946007)(54906003)(446003)(81156014)(8676002)(7696005)(2906002)(229853002)(316002)(102836004)(66066001)(7116003)(64756008)(66556008)(6436002)(66446008)(305945005)(3846002)(6116002)(478600001)(76116006)(71190400001)(71200400001)(26005)(6916009)(7736002)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4229;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dj8DE+1MD8EI0CxyK/4cgyUx52FHTyt8Fhbw3l/rInGIpCzPzQ+SjSI1Cpkvpl8gaboaD8Ggl1T8rYSzB2SrIfM3OKtcg22Z0EvF50vghnbuvMWO6fQePoIfDSdAL8SHAwLGPd8gtll3oLe0gacXYo6IXhKdmcL6zFgg1UGFm1i0sPwvbQz2Ku6xbxgutR0uO0Y85d5y68MbtQddkZe9JQcDkrG74sQns6PBqD0FGJgoWFKvoqRRxHTO2PLmnf438rchl4fg+RIbqOyEZ0EHkyv3I1FAamp+F9BO2amNEJ2eD2Cto1Qjkir4O7N1UL002xjDgi787xzREYxVZHMWyx1K1fg/w8RRh5daE7eMEb8W1lk2O64sWxA6Z/ig/aacy26GrhjTgCTIqneSkDRoBYS3JvknoqBtdHbCaCa95fpqnuMXVISaYvQMXavQ9SHF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d21b871-492e-4715-12fb-08d771a6e955
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 12:56:38.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MLI8lGD6NaChWYJZcMNny2YrDiHHGX8c3vzugqjv8j6QrU3yb9yWCUI5BjCAGifrF2H/IxJ91t7JucTFEyC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_045643_151292_A21F4981 
X-CRM114-Status: UNSURE (   7.95  )
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
Date: Mon, Nov 25, 2019 at 12:25:23

> The 11/25/2019 12:03, Vitor Soares wrote:
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Mon, Nov 25, 2019 at 11:55:16
> > 
> > > The 11/25/2019 11:42, Vitor Soares wrote:
> > > > 
> > > > Hi Boris,
> > > > 
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Date: Mon, Nov 25, 2019 at 11:34:52
> > > > 
> > > > > On Mon, 25 Nov 2019 11:19:44 +0000
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > > 
> > > > > > > > > > 
> > > > > > > > > > I based in all version and tried to pass everything to master.c file.  
> > > > > > > > > 
> > > > > > > > > I'm not sure what that means, but okay.
> > > > > > > > >   
> > > > > > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > > > > > > 
> > > > > > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > > > > > but sure, we can discuss it after your RFC has been posted.  
> > > > > > > > 
> > > > > > > > I need to test if the time that device.c request the mastership and the 
> > > > > > > > controller has effectively the ownership of the bus is short enough to 
> > > > > > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > > > > > housekeeping of bus takeover.
> > > > > > > >   
> > > > > > > > > 
> > > > > > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > > > > > first one to post a patchset and he never really said he didn't
> > > > > > > > > want or didn't have time to continue working on this task (not even
> > > > > > > > > mentioning the time I spent reviewing those patches...).
> > > > > > > > > 
> > > > > > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > > > > > some kind of coordination before the patch is posted).  
> > > > > > > > 
> > > > > > > > Honestly it looks like I'm competing on this which is not the case.
> > > > > > > > I just pointed out my concerns about this adoption because I see several 
> > > > > > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > > > > > master code and integrate in your solution.
> > > > > > > >   
> > > > > > > 
> > > > > > > Can you point me to the version of the patch your changes are based on?
> > > > > > > And also, can you tell me what issues you faced? I would like to check
> > > > > > > if they are already adressed in my code.  
> > > > > > 
> > > > > > I used v3 and v4. From v5, I found useful the switch case (request, 
> > > > > > deliver, handoff, takeover) in hc side.
> > > > > > 
> > > > > > I didn't hardly test how device.c request mastership but I suspect it 
> > > > > > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > > > > > not be the master yet.
> > > > > 
> > > > > I'm pretty sure we solved that already (that's what
> > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > Can you be a bit more specific? What makes you think the master might
> > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > called?
> > > > 
> > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > and not send the CETACCMST immediately.
> > > >
> > > 
> > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > If not, error exit code is returned and we can't make the transfers.
> > > Are you able to implement the same behavior?
> > 
> > You can assume everyone will do in that way. What happen if you receive a 
> > request or an information from current master?
> 
> 1. By default, my HC driver rejects incoming GETACCMST, just nacks that.
> When I want to request mastership, I'm enabling that using MST_ACK and

As I comment  in one of your patch, we need a method as for ibi to enable 
MR for a particular device.
It something that I don't have for now. 

> secondary master starts acking GETACCMST. I can extend that easily if
> needed to ack GETACCMST by default. Just need to handle one more irq.

This is not the case. My understanding is that:

Secondary master do MR request them is polling for a GETACCMST,  am I 
right?

> 
> 2. What kind of information? DEFSLVS?

DEFSLVS, GETSTATUS or other possible CCC.


Best regards,
Vitor Soares



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
