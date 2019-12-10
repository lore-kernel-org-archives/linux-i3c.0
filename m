Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD3BC43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C26020637
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUYGD/Mq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CbYAdhcd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="m4z8YCjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C26020637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKnI7yjcBZeQr23Enpkr8zGzgr1NZwxXlFgPjMS2msc=; b=FUYGD/MqApJHme
	g1KeBPEJf0yH284k/GWCYoVCk0KC/nQKEO0uovao0hjJxRkP1j5X2NbBk384A1x5NLlBqRDEoBF9V
	GRFnI94yJgo79ZWTGzcvXOo3f4liNABD2AeOFMOCNCgEJjTAkb6ycW2gOno6sQYDkGymgnjED+xrS
	AKpP2zZ2kb0jF1zUZBIJAN8VcumFI1Xj36C449FVSF5qTv5+85RnYhBZqp8sUSgKsd8/z83DWKq4U
	R4f6++I/dgYYjEHinSNMnbnhKbHnp09EIc667qeGI8raiyt2XYgFNXzK7scHFfWqtc+CPKnBw+DPn
	Hf2+7kgXZYOPIGZnz4Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegh8-0008ML-VO; Tue, 10 Dec 2019 14:40:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegh6-0008Lo-SA
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 14:40:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A154C00A3;
 Tue, 10 Dec 2019 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575988853; bh=mJZBPpuzgLzcmQZrOQM5+vXgxquro9ac89lgQnDHq3s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CbYAdhcdCBscYbdutGF15RoJZs0rnLpMHTq1MFIyiuQ741FK2PxY7p6THUOF3bDBg
 VWZgij2BPxNGqXM7iaQ4nnuIDOBPfGT0crEMM4rURaR9LbAmJ6ETJ62ayNOrwE4LbU
 deCUXCyygmJtXCZcLplyjrnZ6f9SeGL0bHtpcectaYaHTKryp2pIQfJNx1Y9UKAeA/
 dSjqpfEGojwWUdgQqiDI9/9LSs2iTKzqhobvBjNX/L0081dd77gNKOMFvDnz/Jy9O4
 pCSwUHBUge97GKhDKXEpX0qfTbVPXSZS3O30bJrTlVL8u2Ojte7Xv4ABo6wZZMqwu5
 Zly6GQ+/AoUpQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B3B5EA007E;
 Tue, 10 Dec 2019 14:40:51 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 06:40:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 06:40:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd9Wka0UQ1klLTPx0MjIa2TbLtk5U3f30fARDOuRf9z7rtbXjsxiZPmJ8xxWjLoVrUNOE5sdseMM6jKH/JPI7PGiTHRz+mk1+CVnHr7AjvGrjLr4BVwDxM/xUrRtNovi6IW0gQE949b9bgcSwyintGqXXDWONu5s5Mw9lI4atrfEiu/ap5cGUqFI+W+oiLZtQOvJD3KCkLctCTTX8JsmeUKPYau/tQiaGAjbJdPQM6ADCqG7Iau7/2PF7BWkoGSFmbmlCqPfB7dshiExscAatdO5ANshK2gQBljXTr1FW/tBKWD/xguLcd33KqHCCHDleuHrAgfhoaVPiSt1SGFd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJZBPpuzgLzcmQZrOQM5+vXgxquro9ac89lgQnDHq3s=;
 b=DWFr+A6cxNqhko9XNqi9bwfwPjKOj9FHi31+Qau1sryr7vXg2Uho5goFsueAtO25Jw0y/HX9Atm0kDdPacfPI5a/x09taoKt/LOnWVmJOu99YFlDPGbSK89lkXy7UBLqteZCPkA36UkFX9Lilb0z4wQFe04PTU4H3eDD/PWnXv2ZS2xm4lLHXL75dJH782IuRJ0ygc8gz00I2root7kU0wYCx/WE055rceAbCn5BmEQ/kiqV9/X3K6pljTklU63wCaPHhrvA9O41T9ORpSh8ZFDLINUoi/hKyQkLc2E5WAwOWzx1x1yCHRR9POiVZn1twO+ae+vbWTstUn3Y2SR7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJZBPpuzgLzcmQZrOQM5+vXgxquro9ac89lgQnDHq3s=;
 b=m4z8YCjlwbsON1ru/mg6PDO7VJ7QXHHF7t85rWcAYjnid26nTD2M2nkUYd15+jDrZDHurqrg/FQhXB9E2Q8kHZWrnSdq//r3Hl1CvTpYyBwknj+tvXguGBkOprQHEeSJGoPvd1rynSWQrn8U8gbSTE/rbCooRgQf+Rdk6tiPlI0=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4245.namprd12.prod.outlook.com (20.180.16.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 14:40:49 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 14:40:49 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: =?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Joao Pinto <Joao.Pinto@synopsys.com>
Subject: RE: [PATCH v4 6/6] i3c: master: dw: reattach device on first
 available location of address table
Thread-Topic: [PATCH v4 6/6] i3c: master: dw: reattach device on first
 available location of address table
Thread-Index: AQHVr0Lg6GVg1KbhC0OVMQLYyLDxMqezcE/w
Date: Tue, 10 Dec 2019 14:40:49 +0000
Message-ID: <CH2PR12MB42165699E80C5063BE111BB7AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
 <20191210101502.8401-7-pgaj@cadence.com>
In-Reply-To: <20191210101502.8401-7-pgaj@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNR001TUdVNU9HVXRNV0kxWWkweE1XVmhMVGd5TnpJdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYREJqT1RCbE9Ua3dMVEZpTldJdE1URmxZ?=
 =?utf-8?B?UzA0TWpjeUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1q?=
 =?utf-8?B?RTBNU0lnZEQwaU1UTXlNakEwTmpJME5EWTFNelUxT1Rjd0lpQm9QU0p5ZDBS?=
 =?utf-8?B?dmRVdEJjWGM0TWxGVVZuZFZjbkZPVTFSR2JIbFVTVWs5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJETlU5MlQxbzJMMVpCV0ZWTlozbEhMeTlLWkhoa1VY?=
 =?utf-8?B?bEVTV0l2T0d3elJVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 664d84fb-080c-40de-dd05-08d77d7ef317
x-ms-traffictypediagnostic: CH2PR12MB4245:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4245EA420FBA082FA08DC1EBAE5B0@CH2PR12MB4245.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(199004)(189003)(52536014)(76116006)(66946007)(2906002)(8676002)(71200400001)(5660300002)(66446008)(81156014)(81166006)(55016002)(498600001)(8936002)(110136005)(66556008)(9686003)(4326008)(66574012)(7696005)(6506007)(6636002)(186003)(66476007)(64756008)(86362001)(54906003)(26005)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4245;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JsKYvvzPaLy8wPrs5kOsE2ptUBupwCLVK7VjWB0StoDtZhrclOJkXOtP7Jvn1VmxcdyEizOHrFzS420vR2P8CauvM4kUiZqHb+F1fVMDFswYQpOAC3n5Vq3HHzPdOTwhA3uYvy6HPpGCNmdtSLfU1NnFXIt7Ep8b1ub5vQ7hSPY47S9EiS1VGZ9wQATgl7Z/u8X1Gi7foQWiqbalOUCm3BY498p1BIe26sJF/Rg0O6zztKetxNOOIn0ZRXY4wRLzfpZc1cGmGAgV9DweQtcfaBrCWUeCTbzvR0dGBWtVGC2qVe64wbkAITW2JtD3E5Kd66DulJgVsEw2IzwCuMz0+m0jLMNtnzJFxfmhhwg0tnYni2ip53K4Lu0VeCL1KoxY0TSVnk4LNmoXGp92BM1lWSUuWrM8eTmrqoqWfBxuPosmlY1+4ncy0rCLk+N1rfa7
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 664d84fb-080c-40de-dd05-08d77d7ef317
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 14:40:49.2380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRQuxsSSXcKsmJ2h8c05sB8cN8uOAI+x9hoCJvoMKQAVLNcjtFa8ELKh2e2fEi7esGe53cR1eh+gWn4XKiOp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_064056_985952_F5D16C02 
X-CRM114-Status: GOOD (  11.05  )
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
 "rafalc@cadence.com" <rafalc@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

KytKb8OjbyBQaW50bw0KDQpIaSBQcnplbXlzxYJhdywNCg0KU29ycnkgZm9yIHRoaXMsIGJ1dCBw
bGVhc2UgZHJvcCB0aGlzIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMuIEJvcmlzIGFzIA0KTWFpbnRh
aW5lciBjb3VsZCBhbHJlYWR5IG1lcmdlIGl0IHdoZW4gZ2l2ZXMgcmIgdGFnLg0KDQpGcm9tOiBQ
cnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+DQpEYXRlOiBUdWUsIERlYyAxMCwgMjAx
OSBhdCAxMDoxNTowMg0KDQo+IEZyb206IFZpdG9yIFNvYXJlcyA8dml0b3Iuc29hcmVzQHN5bm9w
c3lzLmNvbT4NCj4gDQo+IEZvciB0b2RheSB0aGUgcmVhdHRhY2ggZnVuY3Rpb24gb25seSB1cGRh
dGUgdGhlIGRldmljZSBhZGRyZXNzIG9uIHRoZQ0KPiBjb250cm9sbGVyLg0KPiANCj4gVXBkYXRl
IHRoZSBsb2NhdGlvbiB0byB0aGUgZmlyc3QgYXZhaWxhYmxlIHRvbywgd2lsbCBvcHRpbWl6ZSB0
aGUNCj4gZW51bWVyYXRpb24gcHJvY2VzcyBhdm9pZGluZyBhZGRpdGlvbmFsIGNoZWNrcyB0byBr
ZWVwIHRoZSBhdmFpbGFibGUNCj4gcG9zaXRpb25zIG9uIGFkZHJlc3MgdGFibGUgY29uc2VjdXRp
dmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaXRvciBTb2FyZXMgPHZpdG9yLnNvYXJlc0BzeW5v
cHN5cy5jb20+DQo+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQcnplbXlzbGF3IEdhaiA8cGdhakBj
YWRlbmNlLmNvbT4NCj4gLS0tDQo+IENoYW5nZSBpbiB2MzoNCj4gICAtIE5vbmUNCj4gDQo+IENo
YW5nZSBpbiB2MjoNCj4gICAtIEFkZCBCb3JpcyByYi10YWcNCj4gLS0tDQo+ICBkcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0
ZXIuYw0KPiBpbmRleCBiMGZmMGUxMmQ4NGMuLmM2Y2FiYTM5YTM0YiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYw0KPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+IEBAIC04OTksNiArODk5LDIyIEBAIHN0YXRpYyBpbnQg
ZHdfaTNjX21hc3Rlcl9yZWF0dGFjaF9pM2NfZGV2KHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwN
Cj4gIAlzdHJ1Y3QgZHdfaTNjX2kyY19kZXZfZGF0YSAqZGF0YSA9IGkzY19kZXZfZ2V0X21hc3Rl
cl9kYXRhKGRldik7DQo+ICAJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSA9IGkzY19k
ZXZfZ2V0X21hc3RlcihkZXYpOw0KPiAgCXN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIgPSB0
b19kd19pM2NfbWFzdGVyKG0pOw0KPiArCWludCBwb3M7DQo+ICsNCj4gKwlwb3MgPSBkd19pM2Nf
bWFzdGVyX2dldF9mcmVlX3BvcyhtYXN0ZXIpOw0KPiArDQo+ICsJaWYgKGRhdGEtPmluZGV4ID4g
cG9zICYmIHBvcyA+IDApIHsNCj4gKwkJd3JpdGVsKDAsDQo+ICsJCSAgICAgICBtYXN0ZXItPnJl
Z3MgKw0KPiArCQkgICAgICAgREVWX0FERFJfVEFCTEVfTE9DKG1hc3Rlci0+ZGF0c3RhcnRhZGRy
LCBkYXRhLT5pbmRleCkpOw0KPiArDQo+ICsJCW1hc3Rlci0+YWRkcnNbZGF0YS0+aW5kZXhdID0g
MDsNCj4gKwkJbWFzdGVyLT5mcmVlX3BvcyB8PSBCSVQoZGF0YS0+aW5kZXgpOw0KPiArDQo+ICsJ
CWRhdGEtPmluZGV4ID0gcG9zOw0KPiArCQltYXN0ZXItPmFkZHJzW3Bvc10gPSBkZXYtPmluZm8u
ZHluX2FkZHI7DQo+ICsJCW1hc3Rlci0+ZnJlZV9wb3MgJj0gfkJJVChwb3MpOw0KPiArCX0NCj4g
IA0KPiAgCXdyaXRlbChERVZfQUREUl9UQUJMRV9EWU5BTUlDX0FERFIoZGV2LT5pbmZvLmR5bl9h
ZGRyKSwNCj4gIAkgICAgICAgbWFzdGVyLT5yZWdzICsNCj4gLS0gDQo+IDIuMTQuMA0KDQpCZXN0
IHJlZ2FyZHMsDQpWaXRvciBTb2FyZXMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
