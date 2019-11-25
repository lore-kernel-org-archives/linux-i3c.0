Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD7DC432C3
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 15:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00DF2068F
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 15:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuVYVLMg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PHpTb4df";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="oYXP2tAN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00DF2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orjLVWjj7JFhH2rHftT8bAeKVc2jFiUVFBcE+bShmLw=; b=TuVYVLMgnabyVI
	YzlVbNk7jWrFU/lyj8t7dKJWC8ielhYpP5RqD+7cyyVkw8WnzfC5DU8u0M7+ix6E/lcNEdLfVJjwS
	Fd+Gi+YhpVdBKMSwF150yEmxsCwPiKMOqRds+SyCCh+IkN5ST9KOdcUvZHFa/BtVdCdzO1WQGgZPb
	HxC/yyEqvokKpMwyq680p7PTAwcAK20Af1v0K/aLjCCvgn0wD/g675FofsEnn9ArziZlCIqQY2rxE
	zaiFQJJaYmlBV8ztcISJOIkONqXibXn4/UVPrMywlPY7gx9n1abNxJ5BxLVh6A/PmOVidv3EAP/ki
	emO/Pu6Q+PR2Sv0NCkYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZGJC-0005db-2o; Mon, 25 Nov 2019 15:29:50 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZGJ8-0005dH-Pq
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 15:29:48 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A63A9423C8;
 Mon, 25 Nov 2019 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574695364; bh=l+fX84qmazErIzghUn7y+/6aodCICuednKx5R9i39YU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PHpTb4dfTh1vjDEfjLYj+W0TtIk1Yyz9F3VcfQ6WP3PfD5XJYerWpzuY14W4u8e7J
 Yq0DB4Yv5OZ1RNRXP7cJnFUmQbXHPci8XmHP+7seNMJZ6Dchxd8zx6elLQZjhF+ZzG
 NFs0O5jlqimGywqsegcuib9NYybih6SU9bcdaRDiMhgIw/SUV6tTOAkkzCQ4dMVHik
 +Pmy5gqObLEbaobtIUHy1qfpB0C/+R4UYcSY8GTRigriOcXGWzOND/jVmfXg6P9wGx
 oiNZkA6QpCLYd1hRUpk47Zerw/yjmVJSJsXHkMc5bPgkgGqRnO3OHXOeG1laTNneL0
 5mYTcWFp6hHXw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 41D5DA0079;
 Mon, 25 Nov 2019 15:22:41 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 07:22:39 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 07:22:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+0/5AtmE7Do2Wyg9ysqSZUHqL9uAFbzJPdW4U2xJ+1n5PiPtnK66QgsAmT/BLOLrv7Q/WFOF+mjc/UJC3lZGn65C4ZV7p/x7YlgxONlShonwBDBkASMhsxZX/WDmKA+wt6m064R11lFbp0Av95ousbn3z57Bb/nBecyKV/y4as7MO0qcnQybC5dN9+DJgI3ZFGos4KgLmaRcS1IbQrl/BAYsvpI/30pl0DEjGO552vYHLrbA5V1lE9Rfn0xGleSW4XiFd8E8auwGL+cedaM6zMvPzxefYFbUoCWlT42sCibysEQ++pmjXnVh4bWhWm/cgKA1ShjepFYk0WTSyn6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+fX84qmazErIzghUn7y+/6aodCICuednKx5R9i39YU=;
 b=cp1UKkdk2sDV5T9LvoVzIY17NNL2qBfuFBDchQXtu2xOZNeW/rvPxBDJ1+n287m2wsKD+CBA9OMGCse228fXUu0DnE+R4qm+wXxTUpQIph0d4/dch8ygtYkkNPPqoQlq2BQVzeRMN1w7dgEBlbFjylywWgrzb+qE3jENp4/fuWw+T7V+jOcWqEcZhU0lvlmYXqwaCQJuZbLxbNMmz1M9VUr6jf2laDmyOgdL/DGOSgjKeyjzqJN9xXtGVT9r4d/7yAU45/AZ2SDE8rsmZrl6TSWcF1i2OGPDuGE/vEtXutmbPNi8gn+aD5pcG5c77l/E4DenValLb9vxG+ibNafaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+fX84qmazErIzghUn7y+/6aodCICuednKx5R9i39YU=;
 b=oYXP2tAND/0Je9XkfDLfUSxNrk6Fuhnpou3wP7O6dob39MPCltPN2qwaqPxvViScoxko34+SiXbtg3UdMKCWWpsM5p8erRUq/N/BSIDIU2koMxGOwx3BO/j1M8xVS5GhOoEq+B9sdj1MDhcmZBHFQQvdE3FCAO4Jqwb98M7TICU=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3893.namprd12.prod.outlook.com (52.132.231.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Mon, 25 Nov 2019 15:22:37 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 15:22:37 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVCAAAUuAIAAARUggAAGeoCAAAYHIIAABy8AgAABCACAAB2oAIAABZ8g
Date: Mon, 25 Nov 2019 15:22:36 +0000
Message-ID: <CH2PR12MB42160734344C24D340BC0980AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125132219.2e45d084@collabora.com>
 <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125140936.47f3d479@collabora.com>
 <CH2PR12MB4216F1775A4F133EF845EC01AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125145924.GA24606@global.cadence.com>
In-Reply-To: <20191125145924.GA24606@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3ROalkyT1RsalptUXRNR1k1TnkweE1XVmhMVGd5TmpndFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRFkyTmprNVkyWm1MVEJtT1RjdE1URmxZ?=
 =?utf-8?B?UzA0TWpZNExXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU16?=
 =?utf-8?B?Z3lPU0lnZEQwaU1UTXlNVGt4TmpnNU5UTXhNVEEyTmpJMElpQm9QU0psUVN0?=
 =?utf-8?B?eWF6VnBRekJzV0hKTldUZG1WelZXT1RKTU4wUk5WMDA5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUpCY0dOSmIzQkxVRlpCWXpJM2EyTnhaRlJaV1dONllu?=
 =?utf-8?B?VlNlWEF4VG1ob2QwOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: d57e7e23-25c4-4268-d31e-08d771bb4d8c
x-ms-traffictypediagnostic: CH2PR12MB3893:
x-microsoft-antispam-prvs: <CH2PR12MB3893850AB6BB45300163A8EBAE4A0@CH2PR12MB3893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(366004)(136003)(43544003)(189003)(199004)(99286004)(5660300002)(8676002)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(186003)(81156014)(14444005)(9686003)(33656002)(54906003)(14454004)(8936002)(76176011)(6916009)(229853002)(81166006)(256004)(6506007)(7116003)(66066001)(102836004)(7696005)(316002)(26005)(74316002)(86362001)(52536014)(4326008)(11346002)(6116002)(478600001)(71190400001)(25786009)(6246003)(3846002)(55016002)(446003)(6436002)(305945005)(7736002)(2906002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3893;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?RVR4M1ZjdUVSRGU4NVdJd1lSNHl0STlERmJrb3dOek9VUzdVTlpieVZ1SEgy?=
 =?utf-8?B?VmxqanRCY2ViSTdCSzh1aUdwZklMSmJNbCsxQng4ZFk3Tmp4V2FtNDdCMm5h?=
 =?utf-8?B?TTg5MEViTVE1RGNyRStEcFFJOFpTU2hOUXJ3RmRFdERBTnpuSGZ2cVJ5WjdC?=
 =?utf-8?B?T3FEaDZvYzA1U01Hb1ZUQmFpZktuSk5XY3oxYkR5Zk1pZ2RHYWx1MVllT2RE?=
 =?utf-8?B?UWlHVHI0bldLeUNqUUVkbEhWUTRkREpFSE1VeDFlZGFhTW9zdkFZV2VPMWx2?=
 =?utf-8?B?a3Y2cUxWcCtjWlVyeXluZHdvL2lZSXlsTlFqbi9Bb1UvbDZUS0xOT3ROdGlZ?=
 =?utf-8?B?QmtPK05tN3lyR2FnV2FaUUpMSU9xSUo4cFZNb2tnTG5oeWM4N3N2dXhQL0ZB?=
 =?utf-8?B?NklxTVRXSGZtN05UYzdZMDNTcTYxWTQ1T0g5SEZvYXhUT1krL3hTQUZyLzZO?=
 =?utf-8?B?WWl6eWQ5NVVXRTI3RUROVm1ZWG9Pc0pLYjBWcmdBMmE5TmVkV1hOYnVLTmU4?=
 =?utf-8?B?bFpnZ3VTMWVSY0pnQkM1cjJrU0F1ditoSzBJdUhrZ0dhVFRteXVrSVF6dGM3?=
 =?utf-8?B?allaa3c4VFhFNmtuY3hndGowa0J3U2xrS1VzTW1CbEhDRHdyeGNaWkl4elYv?=
 =?utf-8?B?T2tPNHhBZ1VtamF6U3hQc0dHT09HZ3ZzYlR3Ti9HUHdJSnByYmQ5V2hsNTRB?=
 =?utf-8?B?QjNrOEpPUGtYcTAxNVpubnFSenQ1VTJyelkvYWN6RzNZOEVjTWRYNXRGSHhm?=
 =?utf-8?B?bUVWOUxTWEpWUkViM20rRktGQjhRY2dhVytHZEEvakU0NEZFMEhQelIwcmJm?=
 =?utf-8?B?Ri9uKzZiRExjWEVtT1hBOCswLzNXWExoZ1UwejVYeW12SkhiYlpGL1VOSnI1?=
 =?utf-8?B?djVydTZoN1BDYXBoRjJkRnY2M3VIR2MrVlV3Y2JCbnk2OVpmWFY1QUxJRUlR?=
 =?utf-8?B?QkFVSk4vWnd1ZFVRT3JOenZiWHByUnJsbHVWdlhCSDJwdzRiakRBZVBnZmo1?=
 =?utf-8?B?MkpPTlRYZzJnKzlBakdqYmtnMTgyZUxRZmIxQzVJc2pTVm1tc3RmT2daVFJx?=
 =?utf-8?B?VmtxcXUvSGh1WEJGODZTR1FYb1JQR0JvL3V3QmNXaUdQamhsQlg2UmN6bFNQ?=
 =?utf-8?B?SVFjcGFBdS9iN3c5RTZIWWRlMys3UisxSjZzRnVqQ1NRK24yK3FsSjByaUcw?=
 =?utf-8?B?YXJ5eDNCRGJxN3VMcSszU1hSVjVSWElxOVA2SGFpRExtR3lvcEhzaWU0Sld3?=
 =?utf-8?B?QXRsMmZpTjVTdUlIMjlWelFpQlllSkY2KzlDdHRwZFZNV3pWK2c2QzFGUDA1?=
 =?utf-8?B?NEUvWFdnekpiM3dBWkhkU2F2eng4NXN4dlJqeXNMczd2Q1BFQU90c3l1RmdJ?=
 =?utf-8?B?eVJtMjJINUJUdkRTRk9YMmhya0VCZU5XK3lwblN4bDBNbUl3OFoxZ0lOcnI3?=
 =?utf-8?B?OXVsUGNmQkZYck1wczV5REppMnJjbjBuUDVUZ0c1ZXZBWTlJbWluNXF2M05W?=
 =?utf-8?B?blJmdDNrU3pjYkpGZXNINXlnVXpqM3pXR2paMFlmcFNjc29RY2M5MnhzMGVm?=
 =?utf-8?B?S29lY2NJYkpJbWREVUdXUGJNak53LzR5VWhJTWJBQUJ1eHZaVEdEb094VXpq?=
 =?utf-8?B?ZTBweHFQUytmVm9ja1lzRjBTK2ZGdHhZUk1JcHBwL1U2ek9Hb2lOLzU1R293?=
 =?utf-8?B?ZHZJRnh2OE56S1dEcjg2WWlPb3ZZak5wMExKRWdjNmN2QnVybGRxRmtCMHlZ?=
 =?utf-8?B?bGg3TTA1RGN6ZWtXU3VyVEJXbUFaaEYwWXkzOEo5MzVxTXN3Q0xEOVNTUSs1?=
 =?utf-8?B?WkZnREFqbHV5V3lYMFN1ak1TOXduSWxKd2NpQ1pvY1A0dld4aWpJeStrMVpZ?=
 =?utf-8?B?dklpNWVzWVI3enFZbHphRE4rbnVtWXNnVVREOEVOdEZIanp4a3VTRVFWT0Uy?=
 =?utf-8?B?SDRycmhoSG50TzZLcjBjSThaTHc1ZC9yaGU3d3ZhSGtRM1cwMU0rOWU1M3RD?=
 =?utf-8?B?WlJGUVJTZFlnWFZJZDNIM0IwNGZZZXQyWXdVNlBmR0F0bXozSTd0Uk4rb1VE?=
 =?utf-8?B?QlJzZ1NzVnBtRVZlY21TTHRCQVBHdW5MeThxSXVrMDJHTTEwbHZCbllLZDRn?=
 =?utf-8?B?Y3pCaUNPeTdUQW5Idnl3Z0FObzFZQ1RKOXhyVWVyOHlMb285TVJWRkw2MFdz?=
 =?utf-8?B?ZDA2RFdrdXNuZjg4RFR0UlhPZUU1S1JRN2hKcTR2d0FxYjg2MlFVVGJGS1RQ?=
 =?utf-8?B?dG1QaWllSVZUbGVzZURaVlAwR0xUa2YvWjR5WG9zMUtPVHZQOFNnWG5WREZD?=
 =?utf-8?B?Wkl1Wm1zQ1habjJ1QWhlTFZzNmxqNHluWUNXTHhnbG1INHRTSmRDYnpMUWs5?=
 =?utf-8?Q?ntyEihZIiNQbPWGw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d57e7e23-25c4-4268-d31e-08d771bb4d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 15:22:36.9425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJ1VADDjzdWnfSfkd+XVOP2l9w/mXX/PCwMlfe6Mn/7J25YgNbxRTOLvS+IJPoqzI4Dqj2JPrCaMm6dZ/0R4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3893
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_072946_883510_D2FBFD86 
X-CRM114-Status: UNSURE (   5.16  )
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
Date: Mon, Nov 25, 2019 at 14:59:26

> The 11/25/2019 14:27, Vitor Soares wrote:
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Mon, Nov 25, 2019 at 13:09:36
> > 
> > > On Mon, 25 Nov 2019 13:00:17 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > 
> > > > > > > > > I'm pretty sure we solved that already (that's what
> > > > > > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > > > > > Can you be a bit more specific? What makes you think the master might
> > > > > > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > > > > > called?    
> > > > > > > > 
> > > > > > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > > > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > > > > > and not send the CETACCMST immediately.
> > > > > > > >    
> > > > > > > 
> > > > > > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > > > > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > > > > > If not, error exit code is returned and we can't make the transfers.
> > > > > > > Are you able to implement the same behavior?    
> > > > > > 
> > > > > > You can assume everyone will do in that way. What happen if you receive a 
> > > > > > request or an information from current master?  
> > > > > 
> > > > > We have this ->request_mastership() method so controllers that have
> > > > > this logic (MR+wait(GETACCMST) automated can still interface with the
> > > > > subsystem.   
> > > > 
> > > > I can also poll the GETACCMST but we are assuming nothing will happen 
> > > > between MR and GETACCMST.
> > > 
> > > Nothing coming from the master that tries to acquire the bus, yes.
> > > Nothing coming from the current master, no, and that shouldn't be a
> > > problem as long as those operations don't involve acquiring bus->lock.
> > > And if some of those operation involve acquiring the lock (I'd still
> > > need to understand which operation that would be) they'll just be
> > > delayed/rejected.
> > 
> > You are assuming this is straight forward which is not the case. Between 
> > MR and GETACCMST may happen everything as in a Master-Slave topology.
> > For me, poll the controller to check when GETACCMST arrive and lock 
> > everything is not a solution.
> > 
> 
> I understand your point. I'm sure that one of my patchset supported
> your use case. I introduced the function which lets the subsystem
> takeover the bus. Even when we receive GETACCMST without requesting
> mastership. I assume you are trying do the same thing now.
> 
> The only thing I remember when you reviewed my patch, you wanted to pass
> device list to that function.
> 

That is not my concern. That is working fine in my side.
Please check spec 1.1 and see if what you are implementing fits on it.

> > > 
> > > > 
> > > > > If your controller handles the MR/GETACCMST separately, it
> > > > > shouldn't be hard to implement, and we can even provide an helper if
> > > > > people end up duplicating the code.  
> > > > 
> > > > I already implement a callback in my code so each controller be able to 
> > > > do their stuff in that in request/deliver mastership.
> > > 
> > > Can you share some details here? What would those callbacks supposed to
> > > do and when would they be called?
> > 
> > My understanding is that different controllers may have different ways to 
> > deliver the bus ownership hence I implemented that.
> > 
> > Best regards,
> > Vitor Soares
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
