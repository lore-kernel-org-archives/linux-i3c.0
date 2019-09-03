Return-Path: <SRS0=vbyI=W6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD42AC3A5A2
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 11:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EEC722CF7
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 11:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqYJbxHI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UmdFrqgU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="AqBn8Hny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EEC722CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFjcBd6pt2mLNc2n5UAFIwsRyFMEoh6v46IIfMoX26Y=; b=CqYJbxHI0yRV5d
	4ARdMioxR2ocf3bXC9LM6TABU7V9lMW/55izpnWvF3Cy+iOeSCP63msQ/58f25ME23mFbydsWH4li
	fKF4vbKHrA/rGrFDPcN1nXmz/JDIkT+HJj+R7XJehn3YSHH7utWfFIWAwjkB5PAUHwER1iFg8k2rx
	Kr8Qu5VDeVym1yxy4LrHZgj3HMjnPcoyJfH6yXfH/7uF48u6KfnDQ7y1boenkhEfNKs/P9pndKiWx
	IR9WYt25J2KfSUruua/kqd5n/Nx3wFuIsIBSZxXvTpV0DwHWMiZsGZXRGtajqjVmdkZ1Y6/7A9AD9
	CNoVU9FVD4BghjHoznLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i57Qq-0004Tb-Dg; Tue, 03 Sep 2019 11:57:08 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i57Qn-0004T7-Gu
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 11:57:07 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E58CC0C3F;
 Tue,  3 Sep 2019 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567511824; bh=kqWUAgjV2PnR7DedwUgNYbZtsqmENthsoE1S0DJbsLg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UmdFrqgU560fXK8f88NpC1Pof4WAOX+fyS83bpXxji+5kUdpIXmkkkjtuNkOZ6oH0
 MMBNKmSoqsytgPrRiriLoOngHa3Sv+eazlYHGt77mnGTaVrnAo7m431eDVtQd9COEP
 ++RC8AJUIEDHAS/tP+SlzDgbU+fNKtxKfSpo/3nlOe4D91jS+1AbIeyUrhCJFaYuds
 1Gl/qRwEqVqGqqutXPGISjHu4flRlOQFdDslWuV1+jT0HfSY91qctVx7NR80tzpAjM
 wUNSxqGpVIf+37dgG7kzPAflAJulH2CaV/Fou6n3JKZEg0qx0qU725smZ4dNqKQBSa
 2XlcOJke6m3kg==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DDC53A005A;
 Tue,  3 Sep 2019 11:57:03 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Sep 2019 04:57:03 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 3 Sep 2019 04:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lliziwt2tnsSqtyDy5GbBYP76ICL7R1f4qa/FHOAJMbCjuYVYxMNV9lfREsVFLq4CuCxtAdrzQ1w4UTq84omdMo7jgxt5ra/7kfcu5PVM5tZVug6hF3Vlh27Ao0FYJwP0wV33VlDVqx0GYzvtI4Rx616Mu5uXm76lb3hfN3TS8DanRU5K1QFgtQ+bKaY2J+WrGl4TO2n3rtSFLejRdva1vzsPgU8xNvjF2ko9CLfojOyApA1EJM/7j7BptBVSmaE4UYBbCqLQdgm/0B20xHQ7+1XTlHEqWd+SeloUg9b9tj3Uf1l4WUPy6dJHGdPtM+dKGpltbi+aIjkqd+kgLuvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqWUAgjV2PnR7DedwUgNYbZtsqmENthsoE1S0DJbsLg=;
 b=N6taNQgNgX3+ebOv1wICyIG9GTnHmbML3rfN4gnwvAavko+xAelEoSD9vqSoArUTqnlE4HLphSYquh23aUDNMKDPv9JvOZIsBCcArUuKi6gnMYN3xb16k5XiOv9U2M2dk4zA46hbGu9R0Ca3Z6NW088eXjHKBlgdnA44gBpzeKx+KSToWLSrR84ZaJtfNFhHTEeZh7j461ghx6aHUGIqsQ61qeiPmnf/Gvvncb9O3zSVu+ROxCrnJ2Ac9uubpVaquT6j1bipOIMW0SIHNxabwkVST3f3DYA89c58egwWzkZDd5tiZyM4K+BNoLC1RA75wu5Xg0b4lgc9h438HEz1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqWUAgjV2PnR7DedwUgNYbZtsqmENthsoE1S0DJbsLg=;
 b=AqBn8Hny6KyvBZ6gnyl49o/2zvyBVbt7JBB2GPh6gO+zCdKQFP//wsj/Wwm09GN2N5YKcBKGpTmzqemmdB0pnPhS2/WaW+KQdwS4XuBrZ2Le9Ru0hB4fyGcHJRekzrnV0KCqhvfwlXEO9bocRK3uysCJgAQSRDT8mCawRXMV8LI=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2669.namprd12.prod.outlook.com (52.135.103.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Tue, 3 Sep 2019 11:57:02 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 11:57:02 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Topic: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Index: AQHVYkN4BGZU9s68oUmgIxnYHrVJiKcZzNSAgAAA7zA=
Date: Tue, 3 Sep 2019 11:57:01 +0000
Message-ID: <SN6PR12MB2655B0C2E9076EF7187A52F3AEB90@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
 <20190903111356.GA23588@global.cadence.com>
In-Reply-To: <20190903111356.GA23588@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RaV1F3TkdFek16VXRZMlUwTVMweE1XVTVMVGd5TlRjdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYR1ZrTURSaE16TTJMV05sTkRFdE1URmxP?=
 =?utf-8?B?UzA0TWpVM0xXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5E?=
 =?utf-8?B?UTRNeUlnZEQwaU1UTXlNVEU1T0RVME1UZzVORFl5TVRJMElpQm9QU0pUT0hC?=
 =?utf-8?B?bU4ybFRaVkU1Y0ZRM1IwSTNMMXA2TkhNNE0zcHBhMUU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUp6VVhJeWQxUnRURlpCWWtKMGEyUXhZV1pEZGxWelJ6?=
 =?utf-8?B?SlNNMVp3T0VzNVVVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZEYTBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVZaNlpHaEhaMEZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
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
x-ms-office365-filtering-correlation-id: 78ca1034-f3d3-4d33-1a26-08d73065d50e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2669; 
x-ms-traffictypediagnostic: SN6PR12MB2669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2669566033764DADC96933EAAEB90@SN6PR12MB2669.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(396003)(366004)(376002)(346002)(136003)(51444003)(189003)(199004)(66066001)(316002)(3846002)(8936002)(99286004)(8676002)(110136005)(81156014)(54906003)(476003)(229853002)(76116006)(11346002)(5660300002)(486006)(52536014)(81166006)(66476007)(25786009)(66556008)(64756008)(66946007)(66446008)(478600001)(4326008)(446003)(6246003)(305945005)(7736002)(6506007)(76176011)(7696005)(55016002)(14454004)(107886003)(74316002)(53936002)(33656002)(6636002)(86362001)(9686003)(71200400001)(256004)(6116002)(14444005)(71190400001)(26005)(6436002)(102836004)(186003)(2906002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2669;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kU+5Pkr/CPxxRp1zUuoaKJrejH11NIlaKwuNnV2YoGnDPIKP0jU3SKk5kIdz8fCQd3EisPsUXf7DOy/JTmx5oLO1uUY3uzWOR/hX4mWLNbnNO6nw1hD4o+6fUsrSEGLLpYYZ5BE4zDXsakjCpHna67UgQZTtqSXJyfggXOEiVPdoEnVMdEjyVCv5gkC8w1lznDxtXjggnSAwqS8RLDHA4UJxhsaYN9F8cwfBjgB2FB9o7YjhqIRtrBIzMgdKnHBlUnTaNG3CHjbgqWXMtWDsZutBMRv7ES25rN/EAgKtn09FGZzPost7HILM3Aw3a7vUpbHkcXmtINFiOotAknv26vo7+xnTlZGAJLrG4k3FEbxyPU59ET2sYqGl/T8liCvHoAyjbt+D8Cf7+JGfboAJXf5jM6c2Nlc/qutsrk1raQ4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ca1034-f3d3-4d33-1a26-08d73065d50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 11:57:01.8866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kh4zHp9s+8Ggi1+2WH5dlIbuXBXcZwqbTpQU1tfXnL8Actri+n8Ci4PWeMm6bcCX3DlJD/+7IgP/DtpLFzfefA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2669
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_045705_580376_4A0CA84C 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Tue, Sep 03, 2019 at 12:13:57

> Hi Vitor,
> 
> I'm sorry for the delay.
> 
> The 09/03/2019 12:35, Vitor Soares wrote:
> > EXTERNAL MAIL
> > 
> > 
> > On pre_assing_dyn_addr() the devices that fail:
> >   i3c_master_setdasa_locked()
> >   i3c_master_reattach_i3c_dev()
> >   i3c_master_retrieve_dev_info()
> > 
> > are kept in memory and master->bus.devs list. This makes the i3c devices
> > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > detaching and freeing the devices that fail on pre_assign_dyn_addr().
> 
> What is the problem with sending devices without dynamic address in DEFSLVS?

How do you address them?
For the DA field in DEFSLVS frame, the spec says: "shall contain the 
current value of the Slave's assigned 7-bit Dynamic address". If the 
device doesn't have the dynamic address assigned yet why send it?

> Shouldn't we still inform rest of the devices about that? About fact that
> device with SA without DA exists on the bus?

I would like to understand what is the use case for this? 

On I3C spec table "I3C Devices Roles vs Responsibilities", Secondary 
Master is not responsible to do Dynamic Address Assignment but it is 
optional to do Hot-Join Dynamic Address Assignment.

> 
> I think that this is limitation for us. Espacially we have SA and DA fields in
> DEFSLVS frame so we are able to distinguish devices with and without Dynamic
> Address.

I would say the reason behind is regarding how to distinguish i2c from 
i3c devices.

> 
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> > Changes in v2:
> >   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
> >   - Convert i3c_master_pre_assign_dyn_addr() to return an int
> > 
> >  drivers/i3c/master.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 5f4bd52..586e34f 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1426,19 +1426,19 @@ static void i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> >  		master->ops->detach_i2c_dev(dev);
> >  }
> >  
> > -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> > +static int i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> >  {
> >  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> >  	int ret;
> >  
> >  	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
> >  	    !dev->boardinfo->static_addr)
> > -		return;
> > +		return 0;
> >  
> >  	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> >  					dev->boardinfo->init_dyn_addr);
> >  	if (ret)
> > -		return;
> > +		return ret;
> >  
> >  	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> >  	ret = i3c_master_reattach_i3c_dev(dev, 0);
> > @@ -1449,10 +1449,12 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> >  	if (ret)
> >  		goto err_rstdaa;
> >  
> > -	return;
> > +	return 0;
> >  
> >  err_rstdaa:
> >  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> > +
> > +	return ret;
> >  }
> >  
> >  static void
> > @@ -1647,7 +1649,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	enum i3c_addr_slot_status status;
> >  	struct i2c_dev_boardinfo *i2cboardinfo;
> >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > -	struct i3c_dev_desc *i3cdev;
> > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> >  	struct i2c_dev_desc *i2cdev;
> >  	int ret;
> >  
> > @@ -1746,8 +1748,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	 * Pre-assign dynamic address and retrieve device information if
> >  	 * needed.
> >  	 */
> > -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> > -		i3c_master_pre_assign_dyn_addr(i3cdev);
> > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > +				 common.node) {
> > +		ret = i3c_master_pre_assign_dyn_addr(i3cdev);
> > +		if (ret) {
> > +			i3c_master_detach_i3c_dev(i3cdev);
> > +			i3c_master_free_i3c_dev(i3cdev);
> > +		}
> > +	}
> >  
> >  	ret = i3c_master_do_daa(master);
> >  	if (ret)
> > -- 
> > 2.7.4
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
