Return-Path: <SRS0=c9Xc=3Y=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E066C2D0B1
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2020 13:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9252084E
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2020 13:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEfHf00f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZokSxk4+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="adKIINox"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9252084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mP+5/1U2DocAIXtPcd9pLR+6CLWuZ8rEjpaofmqueQ=; b=cEfHf00fSb92Qz
	i1amZAz18nzfqxmMAULkX0S/BXjsH9Bphxgb9pxxH1finNUqXXVP/mjwxF5YlR6mI+Va4JhUEU1jc
	aAvpzcTWeRLG1ZR9vJ2QG4dbeWSPSk+AM5JVau07sMK7SLBWbcABiNAeifYFzWAJ3qZ3ibypfdMu+
	Dn8MwHdT36uU79InEwmD4rHB4+uHH8QMEeFNloP5nyq0xwbCxFRtMgg6sBSWsX0COTq0MlUOXXqBh
	q5tB6JLy5Kxcuhs9vdRufDeojhG0+qtJg+SAiGzCcOeCuPiyMO7DOYfmaEFQZmGHOiSkNac4Df5ID
	CQk17qMdaw+Vy2oPCk3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyy7N-0004DW-FI; Tue, 04 Feb 2020 13:19:53 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyy7K-0003oH-Mj
 for linux-i3c@lists.infradead.org; Tue, 04 Feb 2020 13:19:52 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F1F2FC051B;
 Tue,  4 Feb 2020 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580822386; bh=JNckzYBlSDjVIB0K4h1g8vdqzQm84fSkfd+idFid6i8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZokSxk4+16lFNerKSAO7UCpHdB+khMhgLeq6NXeX3MEZSQw+UToWKHh5lWSoehq3V
 uHutErnWz0k7LGcFuHG3dSaRHqcr5m+kMTIzANAfGy3AhTP1HM8jkyGhdMi4fZohxY
 pxawHnuP0M6gOXDrIH9XyDxNO4ooRxs9bstLCNjlrcAXdu2j3NT2s3qjrc3FUle7rj
 KAT60zasu/CLIScrmZfWNgmhCo85NJnI+oLghPdj5B9wNIUVIk5ipQXo3W7OBKBqQN
 dQPNLznfSiYSnoezAa8RYVGv5EoxieqxMw1HJek73ZfC6JCN4A5xY9V/wFHACfZcS/
 Ht+w8uVKJCYaQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3D0C8A0091;
 Tue,  4 Feb 2020 13:19:42 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 4 Feb 2020 05:19:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 4 Feb 2020 05:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg7c8Z/+LPAV3VJHQdlriIrK9Xr/wH+O6M7Y8Z+4EeK2/Dv6Oury7WKN4VI++tn9Xc1QwjRo6ozrsCGeRxqGnY+RM39BvoPhqFh5TsHU/tFBC5rBr3W7ICCKx1Trs8owjmzS4xypZ/ZE5I9hjhxJ6ODN1Z4M78QTEd3JG2U06bVO73tLVi/hxLi8EK9ukQEX1W5f0as/3m5X8A63MaBpZR3UOP52IteT87XHBIEw1uSAnbBEB/ay0wwH7rqM3t29rCJUFW7zSO/Jd/i4c0+2KuueH4yhgpAGen+ERbHTXPK28zsqatVs6dMug6r7rjPwJzaNSQ7GX1J0Se5SaboL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNckzYBlSDjVIB0K4h1g8vdqzQm84fSkfd+idFid6i8=;
 b=VLHfPfQlnGosrpySfkX+23+8MqLwF+Bucn33Nn9fnNS5NQ5svxFXALi8BfvJsboJI1WoFTN0zcVyRrNyzK4UXYzxma77WA2xCsKH3i6sxKg8JwfOf+yapXd9r+f801CTntqZTDL6QzYbC+2QGnx7iYV88N/vDL7JrzmVfJkFwZFR+UNe0KzSLhHoLbWXuHTQC9vorhwwNwGafo4jLWljDgACPd136mgqKZnJPxKurat9j3O0j9H3kIVoeauS4WKFQuExnIjFFMJVjIUQqYgoSryr+zPc6+4ElvEg0EmgRXoqarUQ2Q0QG1nSf0Wnxs0ItaDDMsnfOdBaGMYInaOFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNckzYBlSDjVIB0K4h1g8vdqzQm84fSkfd+idFid6i8=;
 b=adKIINoxKCcypuX46mk0SaQ2lgwyz2WT3CFZkRZuFHJewxNs0u0faMJEL/O0RMLu5mLY1q79bI8m7uY11RaQ9HC9YQ/kOn9kKtTTOuvwJSA+PPYq922WXTr7FX21nq3Mz02IPsRaYBQfnPKZ0eBvJ4oyxPcOwHuWqvZXLcvfI5g=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4103.namprd12.prod.outlook.com (10.141.156.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 4 Feb 2020 13:19:41 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::3c7e:dc0:3013:de3c]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::3c7e:dc0:3013:de3c%6]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 13:19:41 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: RE: [RFC v2 4/4] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Topic: [RFC v2 4/4] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Index: AQHV1p4xoSqRXzcucECuqYwPhyVewqgBtDIAgAAGDqCAAFA2gIAI1szA
Date: Tue, 4 Feb 2020 13:19:41 +0000
Message-ID: <CH2PR12MB42167A5FE6B37056F37DC70AAE030@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <442a0c2c52223f9ff1a1d1018ff863fb23105389.1580299067.git.vitor.soares@synopsys.com>
 <CAK8P3a0uFjhuO7e-i3r_RiA_ni=S8MfYoZUwZzmbXRcd=+kMKw@mail.gmail.com>
 <CH2PR12MB4216ED068AD93C43B2C421A8AE050@CH2PR12MB4216.namprd12.prod.outlook.com>
 <CAK8P3a384ksr95FTxcxr=48G-ytUqmAru7g1JT-Pdfpt1DcLMg@mail.gmail.com>
In-Reply-To: <CAK8P3a384ksr95FTxcxr=48G-ytUqmAru7g1JT-Pdfpt1DcLMg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RabUZsWXpWa05XTXRORGMxTUMweE1XVmhMVGd5T0RndFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYR1poWldNMVpEVmtMVFEzTlRBdE1URmxZ?=
 =?utf-8?B?UzA0TWpnNExXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5U?=
 =?utf-8?B?ZzVOU0lnZEQwaU1UTXlNalV5T1RVNU56ZzJPRE15TURnMUlpQm9QU0pHVFU5?=
 =?utf-8?B?WE1YTmFTRkJ1Y25JMFJrZDVOREJuUm5CQlNuaE5jVWs5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJXYTBwaVFWaGtkbFpCWTFKWFJVTnVSVkF2YVZGNFJs?=
 =?utf-8?B?bFJTMk5STHl0S1FVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: d6b741c6-e169-4b2c-3ebd-08d7a974e48c
x-ms-traffictypediagnostic: CH2PR12MB4103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB41033A4EFA5CF0099A369BC7AE030@CH2PR12MB4103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03030B9493
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(366004)(346002)(396003)(39860400002)(199004)(189003)(8936002)(33656002)(4326008)(81156014)(81166006)(8676002)(2906002)(52536014)(316002)(5660300002)(71200400001)(86362001)(66946007)(66476007)(54906003)(76116006)(64756008)(66446008)(66556008)(6916009)(186003)(26005)(53546011)(6506007)(55016002)(478600001)(7696005)(9686003)(42413003)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4103;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qAbff7RQeR7y42yl1DcJO8olwKCTJfE/VTAoKIlZHlREHJQ3/9SxnlnAfoYx2/bRExb0GqoiPC50rdQz2Oei05OCNpaDhBbRhckIfiG0vrAhd2PE7Odq+5Dd+ckd0A3CAFX+hE7+6D7G3R1HqbkPdLoC4WAmfU5LEsr8Y/iIgXwBWHRNQ3iutx0SuH69N8tVE3yKWXFHP+YJhFy6NlalANsKfmahdY0oqAkLv4MipFHjzV9VmyKIL8MwqDE/vz/ddzmqNT3VPvuIpJ6l6z6REc7wKuuFs4BV9N0A/F2woTLEpMunANW+mAikjjr+9DpJ2fspkuPCjDEphZR7Y/LPmSrvlZIvuItOUriw2Q+O8UD1I5a0sSjhlfz+iqVVQB/ZbOsxhOJ+MwU1kGv1ul8wjETPQeHEN89MneyTZZis1ZVYaf3kE85P1lt/vQoM8EWnfKALLZovCJXYC1l8a/VMWRq+edonJCtSoYNjOu1kVjjrGDOgBos40McEiDslVFt7GGWmKH20xwZp8dXIte2Uzg==
x-ms-exchange-antispam-messagedata: g4iaOTy3KQRBsqD/hbk9HvQGZdzzVvAoaWa02XobLkWEYcbUG36A7U52U2Jv0/hmdsBTI/PmzFmxy4NqMnhoUJxjbf518y1GVvyjBiKWdANIbVsjgiCohKxQBREaq/eGStViBfob4rJ4e+Mp54UdnQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b741c6-e169-4b2c-3ebd-08d7a974e48c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2020 13:19:41.1015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSjaK3lzYHGvLo/GDEr5z4+v7NsUemhPJ3pj6swDvDYnMc7ksTf0odG+K8v396Di8clmioxPXF5cfB6SjUfY2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_051950_931112_CFE616C3 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Wolfram Sang <wsa@the-dreams.de>, gregkh <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, Jan 29, 2020 at 19:39:41

> On Wed, Jan 29, 2020 at 6:00 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >
> > Hi Arnd,
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> > Date: Wed, Jan 29, 2020 at 14:30:56
> >
> > > On Wed, Jan 29, 2020 at 1:17 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >
> > > > +
> > > > +struct i3cdev_data {
> > > > +       struct list_head list;
> > > > +       struct i3c_device *i3c;
> > > > +       struct cdev cdev;
> > > > +       struct device *dev;
> > > > +       int id;
> > > > +};
> > > > +
> > > > +static DEFINE_IDA(i3cdev_ida);
> > > > +static dev_t i3cdev_number;
> > > > +#define I3C_MINORS 16 /* 16 I3C devices supported for now */
> > > > +
> > > > +static LIST_HEAD(i3cdev_list);
> > > > +static DEFINE_SPINLOCK(i3cdev_list_lock);
> > >
> > > Please try to avoid arbitrarily limiting the number of devices you support.
> >
> > Should I use all minors range instead?
> 
> Yes, I'm fairly sure that if you use a dynamic major number, there
> is no downside in using all of them.
> 
> > > Searching through the list feels a little clumsy. If the i3c user interface is
> > > supposed to become a standard feature of the subsystem, it would seem
> > > appropriate to put a pointer into the device to simplify the lookup,
> >
> > Do you mean i3c->dev ?
> 
> I was thinking you could add another member in i3c_device, next to ->dev.
> 
> > > or
> > > just embed the cdev inside of i3c_device.
> >
> > I would prefer to have a pointer in i3c_device for i3cdev_data, but I see
> > others using it in drvdata.
> 
> Ok, I think drvdata should work, but you should check that this is
> correct when the device goes back between being bound to a device
> driver and used through the chardev.

I changed the detach to be done in BUS_NOTIFY_BIND_DRIVER.

> 
> > >
> > > > +static int
> > > > +i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
> > > > +                   unsigned int nxfers)
> > > > +{
> > > > +       struct i3c_priv_xfer *k_xfers;
> > > > +       u8 **data_ptrs;
> > > > +       int i, ret = 0;
> > > > +
> > > > +       k_xfers = kcalloc(nxfers, sizeof(*k_xfers), GFP_KERNEL);
> > > > +       if (!k_xfers)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       data_ptrs = kcalloc(nxfers, sizeof(*data_ptrs), GFP_KERNEL);
> > > > +       if (!data_ptrs) {
> > > > +               ret = -ENOMEM;
> > > > +               goto err_free_k_xfer;
> > > > +       }
> > >
> > > Maybe use a  combined allocation to simplify the error handling?
> >
> > Could you please provide an example?
> 
> Something like
> 
>        k_xfers = kcalloc(nxfers, sizeof(*k_xfers) +
> sizeof(*data_ptrs), GFP_KERNEL);
>        data_ptrs = (void *)k_xfers + (nxfers, sizeof(*k_xfers));
> 
> This would need a comment to explain the pointer math, but the resulting
> object code is slightly simpler.

As we have nferxs, there is no problem to allocate k_xfers more than 
needed, right?

> 
> > > > +       /* Keep track of busses which have devices to add or remove later */
> > > > +       res = bus_register_notifier(&i3c_bus_type, &i3c_notifier);
> > > > +       if (res)
> > > > +               goto out_unreg_class;
> > > > +
> > > > +       /* Bind to already existing device without driver right away */
> > > > +       i3c_for_each_dev(NULL, i3cdev_attach);
> > >
> > > The combination of the notifier and searching through the devices
> > > seems to be racy. What happens when a device appears just before
> > > or during the i3c_for_each_dev() traversal?
> >
> > The i3c core is locked during this phase.
> 
> Ok.
> 
> > > What happens when a driver attaches to a device that is currently
> > > transferring data on the user interface?
> > >
> >
> > It may lost references for inode and file. I need to guarantee there no
> > tranfer going on during the detach.
> > Do you have any suggestion?
> 
> If the notifier is blocking, you could hold another mutex during the transfer
> I think.

A mutex during the transfer will solve the detach issue, I doing some 
tests but even with the change to BUS_NOTIFY_BIND_DRIVER I'm not sure if 
it can race with driver probe function.

> 
> > > Is there any guarantee that the notifiers for attach and detach
> > > are serialized?
> > >
> >
> > Sorry I didn't get this part.
> 
> I think you answered this above: if the i3c code is locked while calling
> the notifier, this cannot happen.
> 

The i3c code is only locked during the i3c_for_each_dev().

> > > > +/**
> > > > + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> > > > + * @data: Holds pointer to userspace buffer with transmit data.
> > > > + * @len: Length of data buffer buffers, in bytes.
> > > > + * @rnw: encodes the transfer direction. true for a read, false for a write
> > > > + */
> > > > +struct i3c_ioc_priv_xfer {
> > > > +       __u64 data;
> > > > +       __u16 len;
> > > > +       __u8 rnw;
> > > > +       __u8 pad[5];
> > > > +};
> > > > +
> > > > +
> > > > +#define I3C_PRIV_XFER_SIZE(N)  \
> > > > +       ((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> > > > +       ? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> > > > +
> > > > +#define I3C_IOC_PRIV_XFER(N)   \
> > > > +       _IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
> > >
> > > This looks like a reasonable ioctl definition, avoiding the usual problems
> > > with compat mode etc.
> >
> > Do you think I should add more reserved fields for future?
> 
> No, what I meant is that I like it the way it is.
> 
>      Arnd

Best regards,
Vitor Soares
_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
