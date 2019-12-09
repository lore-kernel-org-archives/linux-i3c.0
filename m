Return-Path: <SRS0=ySRA=Z7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A34C43603
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 12:20:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FEA207FF
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 12:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtfzHMuh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K6D8mk7G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="YfiF7g4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FEA207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSAzjZTMxvrZCQ+4/gpCRxmV3oGvmVcKFGW8Ai+6LHc=; b=gtfzHMuh6pBnJP
	pcZtQInRDJEvlVAYpRCDuwHQ98MWv+IWG3wkM8fGmXGBXxsknkG0JTJ9OoP0RSEh7XG7JlleWczkb
	GlnEinHm+GGR0Vmmx/q2wX9ogfslqig/E9ZRhBOfxGR5IFP8S+6g7HuCuCPo6tkL8eJXMnTbG3WEH
	/7arXuMId2Ca5pofArQdRQkSNbZp5ZOZpPHWpkjO6u6nSWdYjHPwyqwv3HmwQImaodqqWw7s3qShb
	MmOMIPVI21Zb7iXxiOfTeEOBB5lY7ifmniH8RLPkCm5384ts3RPgXz2ycVRrxuQLIXHe6EtsKCTVt
	xRLz75IDa0QwDPVKY4yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieI1R-0004cl-Se; Mon, 09 Dec 2019 12:20:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieI1O-0004cL-SF
 for linux-i3c@lists.infradead.org; Mon, 09 Dec 2019 12:20:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 354B0C0096;
 Mon,  9 Dec 2019 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575894012; bh=Mj7q4WhuxevxZEX1HxELolftWuPShncYSztUcWAlPDE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=K6D8mk7GM13JeHJA4WYUMca88Hd3trvyp/qny2e2w9YG4ClfJQaXRimZdcEGNDFZF
 PZbdyTl8AOflO7V0dOdatSs0QnXhacHoy+T04AxzEhpbfz9CUYjkNmw9x89eB2SGrU
 HXvPamHqYFnf/UY904j/6+BQjGBqDEy9jGXmqJw22NNrmzpxV3W6Uvpu13MUZLjI9+
 FQztJ8sBmh0hvdpujoau5/VVskY5V2+VNbnjuZdWJ0fON9wONyYU1ILASqvYeISyy0
 KfpMUWBwLI1L52hRnXxW0FLQa4hwu90SY7Jgs1D8nY2zorTQAXD4GnuT3lsFAqxx2q
 0hDgXPh4PAF3g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4726AA007F;
 Mon,  9 Dec 2019 12:20:05 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 9 Dec 2019 04:20:05 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 9 Dec 2019 04:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/Bg7plVntnJ214LdXqx+eMn9iqx4OEcE797wZZ7ZegpnTBPoYJ00xDQYbq9seJdt5yU3EFS7cv/F2YXSAsCvkReQzYkYMraFXCGuD3wnxHqSkM6YYX4Bqac9d2xyzjP6GX2aP1aySHHM2IS/+TcOOpgWl4mgoB/CynQEK++WUYebEJLDuqHA4krUrjWZlFQnZYHcrgEJvVESF5XxCgrb3wDWl3wC+ihAma5BSsGTm9eKKysKWHxwnuyHqITs+u3TQwZU1FQ9LkNpRtPokPN4mvMp3QUHQAN6lOGo2A6i1yTD9XPauUQUlTdnZ/8m2j4gNQkpMSeu8pD+uoJxABl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj7q4WhuxevxZEX1HxELolftWuPShncYSztUcWAlPDE=;
 b=ChR/T4nk8ABL8yxbPK906c8iT58dIPRQmgUEHRHHA+wasJuQKSsOHTe6Kk/YKYV1qE+mJyMljExubGlzFTWEHTuRfwT/jtIUuT21yu48fbquYOGEL6FnXZ/y/lGgzfjqf+h9cjy09BGDcnebYPco7f5zv6AYfEI7nKFkVDBdIiDcuDYCF7pixZ9Oa7k/AluZazARJAyKc+bKQo6OaV9ZUrGktW41w1rnGsRroJN/7bWB2/DkaVF9FrMDmFIS0McdSrAlQmTKaegADty/pCgkqlkSyJTKbg4yO5SkVpG1wLZLky6X6Vvtq0rYcGfGSfj133rB3EA6ArhbNJaD2sW7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj7q4WhuxevxZEX1HxELolftWuPShncYSztUcWAlPDE=;
 b=YfiF7g4XyuzWC3wE/6erlnH0XZq23/XXtL70Firy85RcOxTgN65rs4A1MEHQBbha70poOPzuNxPRFdp5j7a+DCDaMUpFZ0kJTmpFC3/K5kxpuzd7S0BQha/TPKnEt4fskHvrlGdOCQsEP7ekIWdyaMFcuuZ81nNUj67nMwMDncU=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4277.namprd12.prod.outlook.com (20.180.16.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Mon, 9 Dec 2019 12:20:03 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 12:20:03 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>
Subject: RE: [PATCH] i3c: make sure the PID is set before registering the
 device
Thread-Topic: [PATCH] i3c: make sure the PID is set before registering the
 device
Thread-Index: AQHVrdJ4nZAaAnrnDUGcf9+6qEb26aexj5yAgAAmgfA=
Date: Mon, 9 Dec 2019 12:20:03 +0000
Message-ID: <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
 <20191209104711.5a549d31@collabora.com>
In-Reply-To: <20191209104711.5a549d31@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNemRsWVdFMk9HSXRNV0UzWlMweE1XVmhMVGd5TnpBdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRE0zWldGaE5qaGpMVEZoTjJVdE1URmxZ?=
 =?utf-8?B?UzA0TWpjd0xXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1U?=
 =?utf-8?B?Z3pOU0lnZEQwaU1UTXlNakF6TmpjMk1ERXlNalkyT0RjeklpQm9QU0l2VFdG?=
 =?utf-8?B?UmRWSlBkamRaV0U5UWVHZDFUMVJyYVd4VVlqVXZkMFU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUkxVW1KaU5tbHhOMVpCWTNGaWEySkJaM0UyTUdWNWNI?=
 =?utf-8?B?VlNjME5EY25KU05FOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: b4fb4a15-3ee3-49d5-dda6-08d77ca21e92
x-ms-traffictypediagnostic: CH2PR12MB4277:
x-microsoft-antispam-prvs: <CH2PR12MB42778390D0AC8FB33BB55E02AE580@CH2PR12MB4277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(33656002)(76116006)(66946007)(52536014)(7696005)(5660300002)(4326008)(64756008)(26005)(66446008)(478600001)(66476007)(186003)(305945005)(81166006)(81156014)(966005)(229853002)(71200400001)(8936002)(8676002)(66556008)(316002)(9686003)(86362001)(6506007)(54906003)(71190400001)(55016002)(66574012)(110136005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4277;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRAi83HzTDum76QqpcB8Jy0Cv63fr+R44L0VHeGhNK+xeBpvyFoPFf0AkCLloybXL9v5/gUh7VWXNvLj1VILclZWgTfpzIBGP3fgVwGHHumGfokR85jP1aNG9qFvUGi3LpSSAhJjXW2o4n7vcYU7jxVvpWeOjmWstvV4eWesSovnvilbAaj70OvpHf+SxY3Lg+zeYVigomAz63BfBsuiuKi2fPw+kT7kXiKr24geWs+C8A36LEAbxjiEC/GXeREVwKUMS9lvQGTb7VeuUy+kZVOmLdUco5s4iRIHyaEBeKhU/HO7amafOXiMNtl5QKDzl/duQpTD270s9w2i6ygHeuCg9PGqc1P7/XHS6eh6PQuasl9GFsP2PZxXOqXNDN33SThUss/tcJ9YUrH17rnca83c815xvHnX0WjCN7kAdm5eg8tU7ZQXaP1A0gUdoYTC7sLRvUSQBN1dJfu7oL04AOOvvxQ/dCwA6duMwLiWVD4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fb4a15-3ee3-49d5-dda6-08d77ca21e92
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 12:20:03.3631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6aw+O1tGTRXsBh2F97E+ayjV+uHZz+N9l4rXGxbLz1kRXF0tVZpGxHgy7/BxM0aWngoQ8TV2OrTellsYig4+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_042015_126246_D25EAEEB 
X-CRM114-Status: GOOD (  11.17  )
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
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsDQoNCkZyb206IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+DQpEYXRlOiBNb24sIERlYyAwOSwgMjAxOSBhdCAwOTo0NzoxMQ0KDQo+IE9uIFN1
biwgOCBEZWMgMjAxOSAxNToxODozNCArMDEwMA0KPiBQcnplbXlzxYJhdyBHYWogPHBnYWpAY2Fk
ZW5jZS5jb20+IHdyb3RlOg0KPiANCj4gPiBGcm9tOiBQcnplbXlzbGF3IEdhaiA8cGdhakBjYWRl
bmNlLmNvbT4NCj4gPiANCj4gPiBQcm92aXNpb25lZCBJRCAoUElEKSBpcyB0aGUgdmFsdWUgd2l0
aCB3aGljaCBkZXZpY2UgZHJpdmVycyBhcmUNCj4gPiBtYXRjaGVkLiBJIGNoZWNrIHRoZSB2YWx1
ZSBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGRldmljZS4NCj4gPiANCj4gDQo+IENhbiB0aGlzIHNp
dHVhdGlvbiAoaGF2aW5nIGEgZGV2aWNlIHdpdGggYSBEQSBidXQgd2l0aG91dCBhIHZhbGlkIFBJ
RCkNCj4gaGFwcGVuIHJpZ2h0IG5vdyBvciBpcyB0aGlzIHNvbWV0aGluZyB5b3UgbmVlZCB0byBz
dXBwb3J0IHNlY29uZGFyeQ0KPiBtYXN0ZXJzIHdobyByZWNlaXZlIGRldmljZSBEQSAodGhyb3Vn
aCBERUZTVkxTKSB3aXRob3V0IGJlaW5nIGFibGUgdG8NCj4gcXVlcnkgZXh0cmEgaW5mb3JtYXRp
b24gdW50aWwgdGhleSBvd24gdGhlIGJ1cz8NCg0KVGhpcyBpcyB0aGUgdXNlIGNhc2Ugd2hlcmUg
YSBkZXZpY2UgZmFpbHMgdGhlIA0KaTNjX21hc3Rlcl9wcmVfYXNzaWduX2R5bl9hZGRyKCkgYW5k
IEkgYWxyZWFkeSBtZW50aW9uIGl0IG9uIFsxXS4NCkkgc3RpbGwgdGhpbmsgdGhlIGJlc3Qgd2F5
IGlzIHRvIGRldGFjaC9mcmVlIHRoZSBkZXZpY2VzIHRoYXQgZmFpbHMgDQpkdXJpbmcgaTNjX21h
c3Rlcl9wcmVfYXNzaWduX2R5bl9hZGRyKCkuDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUHJ6
ZW15c2xhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTNj
L21hc3Rlci5jIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIu
YyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+ID4gaW5kZXggMDQzNjkxNjU2MjQ1Li4wN2VhOGIw
Yjc3MzYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMNCj4gPiArKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYw0KPiA+IEBAIC0xNDQ5LDcgKzE0NDksOCBAQCBpM2NfbWFzdGVy
X3JlZ2lzdGVyX25ld19pM2NfZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0
ZXIpDQo+ID4gIAkJcmV0dXJuOw0KPiA+ICANCj4gPiAgCWkzY19idXNfZm9yX2VhY2hfaTNjZGV2
KCZtYXN0ZXItPmJ1cywgZGVzYykgew0KPiA+IC0JCWlmIChkZXNjLT5kZXYgfHwgIWRlc2MtPmlu
Zm8uZHluX2FkZHIgfHwgZGVzYyA9PSBtYXN0ZXItPnRoaXMpDQo+ID4gKwkJaWYgKGRlc2MtPmRl
diB8fCAhZGVzYy0+aW5mby5keW5fYWRkciB8fA0KPiA+ICsJCSAgICBkZXNjID09IG1hc3Rlci0+
dGhpcyB8fCAhZGVzYy0+aW5mby5waWQpDQo+ID4gIAkJCWNvbnRpbnVlOw0KPiA+ICANCj4gPiAg
CQlkZXNjLT5kZXYgPSBremFsbG9jKHNpemVvZigqZGVzYy0+ZGV2KSwgR0ZQX0tFUk5FTCk7DQoN
CkJlc3QgcmVnYXJkcywNClZpdG9yIFNvYXJlcw0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTEzMjYwMS8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
