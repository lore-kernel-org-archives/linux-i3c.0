Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C5CC2D0BF
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EC620637
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eVF76IK3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i4pbgppH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="luem3DUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EC620637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Js6ySOZtM7VyypB8xbRTGzrPp9rmuqUWxn9FnMnJIzE=; b=eVF76IK38/CJ7J
	0OSDhP+XbTFU+jTrdZzXna3UwN5WNNiPHHQV52Bw8w2Q+mlVPZszI087cnKyQDSHB3tEzjLQ5d2x5
	XIYONZKWxsAxe82LVawPXggqUM24JN6fPDOZklu9ddva+Fp1YjtfpoR/RfOSCjQnOafZOu8ahE0AZ
	iF9evhh9PzyixJlQd1W2So57oAd2pSaoE0RYaZW6ooMdl0mZKeenu6VR2B9GpDL2hS/b7/tPsK1Ip
	kPXP68M4aA0LSQ2ig/ayn4fbHvXd+xHus/pJq1PXaCP07h9GQGbt2m0UpAfMFL0c0WsxgpGcCgjn4
	3rg/xbrvYNkaKoa/VaRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iehNq-0006nb-Fn; Tue, 10 Dec 2019 15:25:06 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iehNo-0006KU-51
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 15:25:05 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90204C00A3;
 Tue, 10 Dec 2019 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575991502; bh=NbA5MP1aHOhy7Y4KGS5A6xQmOcJvVGuNKZwgHKKY/2o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i4pbgppHaJVt7iCNs07Rd5GJ58PYlvlG+cVdZCLAkhyyffq+ymUlQMubG6d7tM22S
 ttoFXgS3UJApbrJr72vQHpdhMAyLEvfY6uCkuksRVDUyNy0zbMrWY6csViWPPL0Btp
 22X1cAQyAjsZcfg0wx1rrnk208FzxbmgabSh9JyV23eMFHm20czZxHmoQiox3/TedE
 0dxTiQ0Zxs7zp789lwPcaxhm7JeOAJ9iJ3OURKPuADH2yR2RS/fZqx8+zUj4rcklyT
 cfOXlpYQzEhmyrZZ9bovaXshkEwV44Klmcg7iAjHXqTJRa66zrvIGLCGAEaHwEjINp
 N+C+aykOYYLKg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 61916A00CC;
 Tue, 10 Dec 2019 15:25:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 07:25:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 07:25:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vom4nQPecTSjR9SjzC8pLFy1qMuScfcrF0iL3XgLVlVzdzF5cplijRjKhdNexd9GTXiBxO/m7oylwfd7UMJkIlAzJZaKJkcLDbIsBHj9Sv1RAdY+o0+km5Hp+F7uA1PS1rzVY/DH8/uyZbKjoaBI4UCJ1D5+tFAQLmB0ZDgY+nY/fhqjnTjJyihsMMFKi+TMaOU9bGuJTQBfKLsgUyqjb30qYIPpe/uzG0X+Ra/5nYpOVCCA1omI7s95kniWtSQsIXqBvwxMhfDfcJ8SJ+LVgPSCWy9MpPP933KPrKbcPovZRbCuv/rDDcMWu/xRy3r00+DMtZ3gBhEyuCUlD9Zpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbA5MP1aHOhy7Y4KGS5A6xQmOcJvVGuNKZwgHKKY/2o=;
 b=GgqArdIoBVIbu2WQLanwcjes/ntrPgCfoG9TbbLwtsEgX5eg0/QdGFfMZb6qXePZC70HO/lom4Vvhel5CCYxR7QCEc0gnZxvGb/FrqwkCaspMt8JbMnCCHOzrV7VQrK6UNtG5VD4xl0aQzk4RmCY9T975fke4IlOoQqpfizyeV7nwde/FteMHiQLi/hkeHBw0iL1VvZPtiT6GVosIMz/AxrYnmS8aufzID72lsQRWXWrXZkDdoLcSP0xGuqdHwiOHLmLcCww7IPk6nIKDMVv7zr2o1J8CVUqGv79uSpS46vqiwq8QDH4UW2GtkXw4wvPY/iuZLYc6PnoYYFuqcH7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbA5MP1aHOhy7Y4KGS5A6xQmOcJvVGuNKZwgHKKY/2o=;
 b=luem3DUTnlR8kybhPCkBmaCv0yTGuf2DRbCV4zSAmB23ffZzxPMEt3z8dRjAG2v085kopKIdM1iuTGqZrWVq/PtBD/OeqdKjAObALKi95MkYLctcdNfAV+4WyFh5L9mt/FPR26U6uORFzZyYaxVrpF76omlHNgYUxWMXZElEJi8=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4327.namprd12.prod.outlook.com (20.180.17.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 15:24:59 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 15:24:59 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: =?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Subject: RE: [PATCH v4 2/6] i3c: master: pre-reserve boardinfo->init_dyn_addr
 when available
Thread-Topic: [PATCH v4 2/6] i3c: master: pre-reserve boardinfo->init_dyn_addr
 when available
Thread-Index: AQHVr0LdtuBTkMiKFkms/jlvCE2aC6ezcS6A
Date: Tue, 10 Dec 2019 15:24:59 +0000
Message-ID: <CH2PR12MB4216FBF6BA2155A47C76D180AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
 <20191210101502.8401-3-pgaj@cadence.com>
In-Reply-To: <20191210101502.8401-3-pgaj@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNemczWVRjMFlqSXRNV0kyTVMweE1XVmhMVGd5TnpJdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRE00TjJFM05HSXpMVEZpTmpFdE1URmxZ?=
 =?utf-8?B?UzA0TWpjeUxXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1U?=
 =?utf-8?B?YzRNQ0lnZEQwaU1UTXlNakEwTmpVd09UZ3hPVGMzTlRZM0lpQm9QU0pzVkZO?=
 =?utf-8?B?RWNXcGlhMFpzWVdaS2VWQTRialZ0WW5oSFYwaHJVRkU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJtWWxjdk4ySmhMMVpCV25GRWRsVmxVM0p6ZWs1dGIw?=
 =?utf-8?B?ODVValZMZFhwTk1FOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: c97a5e8e-e758-40d8-3fcb-08d77d851ef3
x-ms-traffictypediagnostic: CH2PR12MB4327:
x-microsoft-antispam-prvs: <CH2PR12MB432715FC73534A7317C1EAC2AE5B0@CH2PR12MB4327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(6506007)(81156014)(26005)(64756008)(71200400001)(33656002)(81166006)(2906002)(498600001)(55016002)(76116006)(186003)(8936002)(5660300002)(54906003)(110136005)(86362001)(4326008)(66946007)(66446008)(66476007)(66556008)(8676002)(7696005)(52536014)(9686003)(66574012);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4327;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wO3TsVu75t1IXk74hXndb5BDwOzSQosWqXr+3aC+ldXCslAg6d5p8TwsD9sHY6k8+xgYgxu2O+zLNXVqSW3VYKjQzZGzXvq8YM7nycTmvTFklb2GC2qK4Lo6EodP+M1xndowRqCxaPboEvi/ODMyP8rYEuMNQf5KtQQXPM+ak/Wj4Z03MW3TcLEPp1DnVueAP5gRsoHsz5k+jW5MmhhPRwwe9pc3V7ZP6gblZf+l8Ppc09xLu8XPdSm64mvRvQHJFZgdtMQn8qoO7+JXlGWN5CwRX2GUmxFvUKY/AVwKNtDzIt/EPgZRI19k1EfyFXARMD3iap3vA8N86SdYKh0q4U3/pN/sOASy0PlhqxNeI9wtPhdIjpV8NOZC445gckFV67JUyUC8KXRp6id27I5m8s9QitGM+PcGKEKu0EgfN93X0MNSwaJ2f93LB3gRm64n
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c97a5e8e-e758-40d8-3fcb-08d77d851ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 15:24:59.8260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuuhApaPjRyxzHeLc1MTz5nlVIUt4T8B47qxYVEez1J8+YyG1VGOkplXtEgf/Oo33ewuT6dA63TInGmSS0faLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_072504_282880_04D04247 
X-CRM114-Status: GOOD (  13.90  )
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

SGkgUHJ6ZW15c8WCYXcsDQoNCkZyb206IFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNv
bT4NCkRhdGU6IFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDEwOjE0OjU4DQoNCj4gSXQgbWF5IGJlIHRo
ZSBjYXNlIHRoYXQgU0VUREFTQSBmYWlscyBmb3Igc29tZSByZWFzb24uIFJlc2VydmUNCj4gLT5p
bml0X2R5bl9hZGRyIHdoZW4gaXQncyBkZWZpbmVkIHRvIHByZXZlbnQgYXNzaWduaW5nIHRoaXMg
YWRkcmVzcw0KPiB0byBhbm90aGVyIHNsYXZlIGRldmljZS4gVGhpcyB3YXkgd2hlbiBkZXZpY2Ug
c2hvd3MgdXAgd2UgZG9uJ3QNCj4gaGF2ZSB0byByZS1hc3NpZ24gYWRkcmVzc2VzLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jIHwgOCArKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMNCj4gaW5kZXggNWMwNmM0MWU2
NjYwLi5mYWI2ZTA2MDlmY2EgMTAwNzU1DQo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+
ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+IEBAIC0xMjYzLDcgKzEyNjMsOCBAQCBzdGF0
aWMgdm9pZCBpM2NfbWFzdGVyX3B1dF9pM2NfYWRkcnMoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2
KQ0KPiAgCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfRlJFRSk7DQo+ICANCj4gIAlpZiAoZGV2LT5i
b2FyZGluZm8gJiYgZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2FkZHIpDQo+IC0JCWkzY19idXNf
c2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVzLCBkZXYtPmluZm8uZHluX2FkZHIsDQo+
ICsJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVzLA0KPiArCQkJCQkg
ICAgIGRldi0+Ym9hcmRpbmZvLT5pbml0X2R5bl9hZGRyLA0KPiAgCQkJCQkgICAgIEkzQ19BRERS
X1NMT1RfRlJFRSk7DQo+ICB9DQo+ICANCj4gQEAgLTE2NzUsNiArMTY3NiwxMSBAQCBzdGF0aWMg
aW50IGkzY19tYXN0ZXJfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFz
dGVyKQ0KPiAgCQkJCXJldCA9IC1FQlVTWTsNCj4gIAkJCQlnb3RvIGVycl9kZXRhY2hfZGV2czsN
Cj4gIAkJCX0NCj4gKw0KPiArCQkJLyogUmVzZXJ2ZSB0aGUgc2xvdC4gKi8NCj4gKwkJCWkzY19i
dXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVzLA0KPiArCQkJCQkJICAgICBpM2Ni
b2FyZGluZm8tPmluaXRfZHluX2FkZHIsDQo+ICsJCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfSTND
X0RFVik7DQo+ICAJCX0NCj4gIA0KPiAgCQlpM2NkZXYgPSBpM2NfbWFzdGVyX2FsbG9jX2kzY19k
ZXYobWFzdGVyLCAmaW5mbyk7DQo+IC0tIA0KPiAyLjE0LjANCg0KSW4gbXkgZXhwZXJpZW5jZSB3
ZSBzaG91bGQgcHJlLXJlc2VydmUgYWxsIERUIERBIGVudHJpZXMgYW5kIG5vdCB1c2UgdGhlbSAN
CmR1cmluZyB0aGUgRU5UREFBIGZvciBzYWZldHkgcmVhc29ucy4NClRoYXQgd291bGQgYmUgb25l
IG9mIG15IG5leHQgc3RlcHMgaW4gdGhpcyBwYXRjaCBzZXJpZXMuDQoNCkJlc3QgcmVnYXJkcywN
ClZpdG9yIFNvYXJlcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
