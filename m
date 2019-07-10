Return-Path: <SRS0=osPH=VH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD457C74A36
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jul 2019 18:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE14820844
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jul 2019 18:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMtPj8Li";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LIU8owQ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="jduJFm1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE14820844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLnWc79KSrUcTMGA8kAdehFO5wYbmzKyb4erDKcJxFw=; b=UMtPj8LixAgxRc
	2qz7RPmEMF/YO8FUFLv5mvMut7RN5otLLXWmfnPEE3B8OrpQoBFGF5b05PKm/71eDcZeRhnoCqMHR
	EvGCybKUcPGk2zRPH4tUCOFXZRKxjhhwvah20/kQPEKvxXyAk2Vs2lG2ggK51qAumL5XyPrbgEZYy
	EGw23eQowyqxAogw0AyHhWk7avm5DB/QNpHGE99d2zMoihJ5s0iWr2EoRX1htLc6ZZHMwm6T265hD
	H2Di9Ocj3Jjo0gwDUkhYQq+MYOa1+JSiOyoqgQJ4wSHajlFvtk1aLL56J7A4/PIo5ThVkJK1HP1US
	dEXQcfHfu2fayxXsidbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlGxa-0004K5-5i; Wed, 10 Jul 2019 18:04:54 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlGxV-0004J8-5w
 for linux-i3c@lists.infradead.org; Wed, 10 Jul 2019 18:04:52 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 799B0C263A;
 Wed, 10 Jul 2019 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562781886; bh=A8/0JaySBNf2LoHMZFUlktZiTzfsxIKaOrpExsYRMm4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=LIU8owQ44LNH8XW/0TVIcePnOs9+aZ4xiJXKtex8wVKPc6LgYM2sg3niFNea9kKV6
 iV1MyJK3Zb6gBSPUEEntfLQzjio3+yzY/j9K0aWl14GdgOn4ihCHiIqOvvVb7z5p3F
 u1uI461I+Jb3KsTW5wDBXs79nuSKeby4PHiMm+5nbCKgSCbnNXg2inBWfgtOHHD2Ev
 qtReCvqczyd9ZwxH4ie5+bx2/v/bi0GTaYLp67udNV7xbhkvZVyCjudncXPE8Z4WcN
 NEc1iCfeClDhOmUwp/IhXVABMGRUf2gPcgDF/UplZ9q32nzk/Eir0X8I0+jVCtNEET
 EcJVRbRwOng6g==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D7D1DA023B;
 Wed, 10 Jul 2019 18:04:45 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 10 Jul 2019 11:04:45 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 10 Jul 2019 11:04:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVprgiNPq2bUTQkUvmQ0kXHpWzFzN8zJSHl1nF+OsTQ=;
 b=jduJFm1/9LqNnkqUz9AAJV8xbNUpp2AfwvAiuC7ZG5Y8a1G6ug64uyrTU/fF2QmBGsV6lr4YQ2zZXJ98nDmh3AfPYG7M3Xg1JN7zDZP323xy91XP4wrFKt/M2BR5Fo6UimcW1D/kbBCYYA+PGd6D/S3Ny+Tyo6FicnbuHCT8by8=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2751.namprd12.prod.outlook.com (52.135.107.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 18:04:39 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::1dbd:69dc:e782:92b6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::1dbd:69dc:e782:92b6%6]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 18:04:39 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>
Subject: RE: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHVKTzvS0luBz5Hrkq+/RgY+Ornt6bEKIMA
Date: Wed, 10 Jul 2019 18:04:39 +0000
Message-ID: <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
In-Reply-To: <1561236905-8901-5-git-send-email-pgaj@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: bbrezillon@kernel.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMjg4MDJkYmYtYTMzZC0xMWU5LTgyNGEtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDI4ODAyZGMwLWEzM2QtMTFlOS04MjRhLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMzcyODEiIHQ9IjEzMjA3MjU1NDc1ODQx?=
 =?us-ascii?Q?NzQyNiIgaD0iZGxscW1FeDBPSGwwdUZlVi9FZEhZYzNpNi9jPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFB?=
 =?us-ascii?Q?U0xQVHVTVGZWQVNhN2J3OXpMbnJiSnJ0dkQzTXVldHNPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFWemRoR2dBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04074887-dc2c-4746-6326-08d7056113c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2751; 
x-ms-traffictypediagnostic: SN6PR12MB2751:
x-microsoft-antispam-prvs: <SN6PR12MB275179BCA4712B7C9A7DE0C2AEF00@SN6PR12MB2751.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(396003)(346002)(39860400002)(199004)(189003)(30864003)(5660300002)(14454004)(52536014)(186003)(86362001)(81156014)(26005)(7696005)(81166006)(102836004)(305945005)(74316002)(76176011)(8676002)(71190400001)(71200400001)(66946007)(66476007)(6506007)(66446008)(66556008)(76116006)(7736002)(2501003)(64756008)(2906002)(54906003)(476003)(25786009)(99286004)(66066001)(110136005)(53936002)(486006)(14444005)(5024004)(8936002)(256004)(11346002)(446003)(53946003)(6246003)(4326008)(9686003)(6436002)(55016002)(508600001)(229853002)(316002)(68736007)(33656002)(3846002)(6116002)(559001)(569006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2751;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sle8VbVp1gM+cklk11jSk0GYuEAyK61I0VFalDy0Y2dczCZFYK7b3d8aCM2vdqInxFwS9OK4+EPIvlez1wOP0hDczYxDboxp2GFGJuMVaa7QIuo+goJTy4eLvOpkWfQYqjuOKxSpa0yekxw9n7zHmBe12TpjqHOkZvDewbJz7vdiavL96foEZPhKAVxPomQO+CiH7kTNa8GFXY6LJGbf4+tABPQEHOxiHKs1LdleZa35ULh4hDfTtKrC12Zs6SZ+wBRfL0XmHJNAPpaEFzQv92fKSRrNNXc1X82+F7lnj+0O3iW5vOlp7wdODFTJ9tXMWAywgGdqDVPpO3DJIXgJ7wuU1y/kRtex4F6PoTDIR7ct2Wm6XaHmOCW4VIV5x7rem1O9t5U3VEpE233L3/ePgpHlvooynYARt1C77HSt/Mo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04074887-dc2c-4746-6326-08d7056113c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 18:04:39.6510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soares@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_110449_322167_76CD883F 
X-CRM114-Status: GOOD (  21.41  )
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
 "vitor.soares@synopsys.com" <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Sat, Jun 22, 2019 at 21:55:02

> This patch adds support for mastership request to I3C subsystem.
> 
> Mastership event is enabled globally.
> 
> Mastership is requested automatically when device driver
> tries to transfer data using master controller in slave mode.
> 
> There is still some limitation:
> - I2C devices are registered on secondary master side if boardinfo
> entry matching the info transmitted through the DEFSLVS frame.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> ---
> 
> Main changes between v4 and v5:
> - Add function to test if master owns the bus
> - Add i3c_secondary_master_register() function
> - Add populate_bus() hook to populate the bus after mastership takeover

For me this task is for the sub-system not the host controller.

> - Rework device information retrieval to allow adding partialy discovered
> devices
> 
> Main changes between v3 and v4:
> - Add i3c_master_acquire_bus_ownership to acquire the bus
> - Refactored the code
> 
> Main changes between v2 and v3:
> - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> lock from maintenance to normal use
> - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> - Reworked I2C devices registration on secondary master side
> 
> Changes in v2:
> - Add mastership disable event hook
> - Changed name of mastership enable event hook
> - Add function to test if master owns the bus
> - Removed op_mode
> - Changed parameter of i3c_master_get_accmst_locked, no need to
> pass full i3c_device_info
> - Changed name of mastership enable event hook
> - Add function to test if master owns the bus
> - Removed op_mode
> - Changed parameter of i3c_master_get_accmst_locked, no need to
> pass full i3c_device_info
> - Removed redundant DEFSLVS command before GETACCMST
> - Add i3c_master_bus_takeover function. There is a need to lock
> the bus before adding devices and no matter of the controller
> devices have to be added after mastership takeover.
> - Add device registration during initialization on secondary master
> side. Devices received by DEFSLVS (if occured). If not, device
> initialization is deffered untill next mastership request.
> ---
>  drivers/i3c/device.c       |  26 ++
>  drivers/i3c/internals.h    |   4 +
>  drivers/i3c/master.c       | 588 ++++++++++++++++++++++++++++++++++++++-------
>  include/linux/i3c/master.h |  34 ++-
>  4 files changed, 563 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..b60f637 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  	}
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
>  	int ret = -ENOENT;
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_enable_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
>  		return -EINVAL;
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
>   */
>  void i3c_device_free_ibi(struct i3c_device *dev)
>  {
> +	int ret;
> +
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		i3c_dev_free_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86b7b44..cdfc5bf 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
>  
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);

These function are static.

> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> +

What do you think to pass this logic to master.c?

>  
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index cbace14..3b44e66 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -93,6 +93,18 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
>  	up_read(&bus->lock);
>  }
>  
> +/*
> + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> + * operation
> + *
> + * Should be called when a maintenance operation is done and normal
> + * operation is planned. See i3c_bus_maintenance_lock() and
> + * i3c_bus_normaluse_lock() for more details.
> + */
> +static void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> +{
> +	downgrade_write(&bus->lock);
> +}
>  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>  {
>  	return container_of(dev, struct i3c_master_controller, dev);
> @@ -341,6 +353,22 @@ static int i3c_device_probe(struct device *dev)
>  	return driver->probe(i3cdev);
>  }
>  
> +static int
> +i3c_master_enable_mr_events_locked(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->enable_mr_events)
> +		return -ENOTSUPP;
> +
> +	return master->ops->enable_mr_events(master);
> +}
> +
> +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->disable_mr_events)
> +		return;
> +
> +	master->ops->disable_mr_events(master);
> +}

Add new line.

It is not clear to me what you expect with these functions. Do you want 
to enable MR from all devices? Just some of them? How do you decide which 
secondary masters are allow earn the bus ownership?

>  static int i3c_device_remove(struct device *dev)
>  {
>  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> @@ -462,6 +490,42 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  	return 0;
>  }
>  
> +static int
> +i3c_master_request_mastership_locked(struct i3c_master_controller *master)
> +{
> +	if (WARN_ON(master->init_done &&
> +	    !rwsem_is_locked(&master->bus.lock)))
> +		return -EINVAL;
> +
> +	if (!master->ops->request_mastership)
> +		return -ENOTSUPP;
> +
> +	return master->ops->request_mastership(master);
> +}
> +
> +static int i3c_master_owns_bus(struct i3c_master_controller *master)
> +{
> +	return (master->bus.cur_master == master->this);
> +}
> +
> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master)
> +{
> +	int ret;
> +
> +	if (!i3c_master_owns_bus(master)) {
> +		i3c_bus_normaluse_unlock(&master->bus);
> +		i3c_bus_maintenance_lock(&master->bus);
> +
> +		ret = i3c_master_request_mastership_locked(master);
> +		if (ret) {
> +			i3c_bus_maintenance_unlock(&master->bus);
> +			return ret;
> +		}
> +		i3c_bus_downgrade_maintenance_lock(&master->bus);
> +	}
> +
> +	return 0;
> +}
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -636,6 +700,22 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
>  	return dev;
>  }
>  
> +static struct i2c_dev_desc *
> +i3c_master_alloc_i2c_dev_no_boardinfo(struct i3c_master_controller *master,
> +				      u16 addr, u8 lvr)

u8 addr.

> +{
> +	struct i2c_dev_desc *dev;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->common.master = master;
> +	dev->addr = addr;
> +	dev->lvr = lvr;
> +
> +	return dev;
> +}
>  static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
>  				   u16 payloadlen)
>  {
> @@ -705,6 +785,8 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
>  	struct i2c_dev_desc *dev;
>  
>  	i3c_bus_for_each_i2cdev(&master->bus, dev) {
> +		if (!dev->boardinfo)
> +			continue;
>  		if (dev->boardinfo->base.addr == addr)
>  			return dev;
>  	}
> @@ -1478,7 +1560,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  		return;
>  
>  	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> -		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> +		if (desc->dev || !desc->info.dyn_addr ||
> +		    desc == master->this || !desc->info.pid)
>  			continue;
>  
>  		desc->dev = kzalloc(sizeof(*desc->dev), GFP_KERNEL);
> @@ -1504,6 +1587,69 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  	}
>  }
>  
> +static struct i2c_dev_boardinfo *
> +i3c_master_find_i2c_boardinfo(const struct i3c_master_controller *master,
> +			      u16 addr, u8 lvr)

Same.

> +{
> +	struct i2c_dev_boardinfo *i2cboardinfo;
> +
> +	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> +		if (i2cboardinfo->base.addr == addr &&
> +		    i2cboardinfo->lvr == lvr)
> +			return i2cboardinfo;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void
> +i3c_master_register_new_i2c_devs(struct i3c_master_controller *master)
> +{
> +	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
> +	struct i2c_dev_desc *i2cdev;
> +
> +	if (!master->init_done)
> +		return;
> +
> +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> +
> +		if (i2cdev->dev)
> +			continue;
> +
> +		if (!i2cdev->boardinfo)
> +			continue;
> +
> +		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> +	}
> +}
> +
> +static int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +					u8 addr)
> +{
> +	struct i3c_ccc_getaccmst *accmst;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> +	if (!accmst)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> +
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (dest.payload.len != sizeof(*accmst))
> +		ret = -EIO;
> +
> +out:
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
>  /**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
> @@ -1548,10 +1694,6 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
>  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
>  		return -EINVAL;
>  
> -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> -	    master->secondary)
> -		return -EINVAL;
> -
>  	if (master->this)
>  		return -EINVAL;
>  
> @@ -1560,7 +1702,8 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
>  		return PTR_ERR(i3cdev);
>  
>  	master->this = i3cdev;
> -	master->bus.cur_master = master->this;
> +	if (!secondary)
> +		master->bus.cur_master = master->this;
>  
>  	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> @@ -1601,37 +1744,7 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>  	}
>  }
>  
> -/**
> - * i3c_master_bus_init() - initialize an I3C bus
> - * @master: main master initializing the bus
> - *
> - * This function is following all initialisation steps described in the I3C
> - * specification:
> - *
> - * 1. Attach I2C and statically defined I3C devs to the master so that the
> - *    master can fill its internal device table appropriately
> - *
> - * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> - *    the master controller. That's usually where the bus mode is selected
> - *    (pure bus or mixed fast/slow bus)
> - *
> - * 3. Instruct all devices on the bus to drop their dynamic address. This is
> - *    particularly important when the bus was previously configured by someone
> - *    else (for example the bootloader)
> - *
> - * 4. Disable all slave events.
> - *
> - * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> - *    devices that have a static address
> - *
> - * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> - *    remaining I3C devices
> - *
> - * Once this is done, all I3C and I2C devices should be usable.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
> - */
> -static int i3c_master_bus_init(struct i3c_master_controller *master)
> +static int i3c_master_attach_static_devs(struct i3c_master_controller *master)
>  {
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
> @@ -1640,32 +1753,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> -	/*
> -	 * First attach all devices with static definitions provided by the
> -	 * FW.
> -	 */
>  	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
>  		status = i3c_bus_get_addr_slot_status(&master->bus,
>  						      i2cboardinfo->base.addr);
> -		if (status != I3C_ADDR_SLOT_FREE) {
> -			ret = -EBUSY;
> -			goto err_detach_devs;
> -		}
> +		if (status != I3C_ADDR_SLOT_FREE)
> +			return -EBUSY;
>  
>  		i3c_bus_set_addr_slot_status(&master->bus,
>  					     i2cboardinfo->base.addr,
>  					     I3C_ADDR_SLOT_I2C_DEV);
>  
>  		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
> -		if (IS_ERR(i2cdev)) {
> -			ret = PTR_ERR(i2cdev);
> -			goto err_detach_devs;
> -		}
> +		if (IS_ERR(i2cdev))
> +			return PTR_ERR(i2cdev);
>  
>  		ret = i3c_master_attach_i2c_dev(master, i2cdev);
>  		if (ret) {
>  			i3c_master_free_i2c_dev(i2cdev);
> -			goto err_detach_devs;
> +			return ret;
>  		}
>  	}
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> @@ -1676,27 +1781,68 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  		if (i3cboardinfo->init_dyn_addr) {
>  			status = i3c_bus_get_addr_slot_status(&master->bus,
>  						i3cboardinfo->init_dyn_addr);
> -			if (status != I3C_ADDR_SLOT_FREE) {
> -				ret = -EBUSY;
> -				goto err_detach_devs;
> -			}
> +			if (status != I3C_ADDR_SLOT_FREE)
> +				return -EBUSY;
>  		}
>  
>  		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> -		if (IS_ERR(i3cdev)) {
> -			ret = PTR_ERR(i3cdev);
> -			goto err_detach_devs;
> -		}
> +		if (IS_ERR(i3cdev))
> +			return PTR_ERR(i3cdev);
>  
>  		i3cdev->boardinfo = i3cboardinfo;
>  
>  		ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  		if (ret) {
>  			i3c_master_free_i3c_dev(i3cdev);
> -			goto err_detach_devs;
> +			return ret;
>  		}
>  	}
>  
> +	return 0;
> +}
> +
> +/**
> + * i3c_master_bus_init() - initialize an I3C bus
> + * @master: main master initializing the bus
> + *
> + * This function is following all initialisation steps described in the I3C
> + * specification:
> + *
> + * 1. Attach I2C and statically defined I3C devs to the master so that the
> + *    master can fill its internal device table appropriately
> + *
> + * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> + *    the master controller. That's usually where the bus mode is selected
> + *    (pure bus or mixed fast/slow bus)
> + *
> + * 3. Instruct all devices on the bus to drop their dynamic address. This is
> + *    particularly important when the bus was previously configured by someone
> + *    else (for example the bootloader)
> + *
> + * 4. Disable all slave events.
> + *
> + * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> + *    devices that have a static address
> + *
> + * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> + *    remaining I3C devices
> + *
> + * Once this is done, all I3C and I2C devices should be usable.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +static int i3c_master_bus_init(struct i3c_master_controller *master)
> +{
> +	struct i3c_dev_desc *i3cdev;
> +	int ret;
> +
> +	/*
> +	 * First attach all devices with static definitions provided by the
> +	 * FW.
> +	 */
> +	ret = i3c_master_attach_static_devs(master);
> +	if (ret)
> +		goto err_detach_devs;
>  	/*
>  	 * Now execute the controller specific ->bus_init() routine, which
>  	 * might configure its internal logic to match the bus limitations.
> @@ -1780,45 +1926,76 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  }
>  
>  /**
> - * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> - * @master: master used to send frames on the bus
> - * @addr: I3C slave dynamic address assigned to the device
> + * i3c_master_add_i2c_dev_locked() - add an I2C slave to the bus
> + * @master: master used to register I2C device
> + * @addr: I2C device address
> + * @lvr: legacy virtual register value
>   *
> - * This function is instantiating an I3C device object and adding it to the
> - * I3C device list. All device information are automatically retrieved using
> - * standard CCC commands.
> - *
> - * The I3C device object is returned in case the master wants to attach
> - * private data to it using i3c_dev_set_master_data().
> + * This function is instantiating an I2C device object and adding it to the
> + * I2C device list.
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
>   * Return: a 0 in case of success, an negative error code otherwise.
>   */
> -int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> -				  u8 addr)
> +int i3c_master_add_i2c_dev_locked(struct i3c_master_controller *master,
> +				  u16 addr, u8 lvr)
>  {
> -	struct i3c_device_info info = { .dyn_addr = addr };
> -	struct i3c_dev_desc *newdev, *olddev;
> -	u8 old_dyn_addr = addr, expected_dyn_addr;
> -	struct i3c_ibi_setup ibireq = { };
> -	bool enable_ibi = false;
> +	enum i3c_addr_slot_status status;
> +	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
>  	if (!master)
>  		return -EINVAL;
>  
> -	newdev = i3c_master_alloc_i3c_dev(master, &info);
> -	if (IS_ERR(newdev))
> -		return PTR_ERR(newdev);
> +	status = i3c_bus_get_addr_slot_status(&master->bus,
> +					      addr);
> +	if (status != I3C_ADDR_SLOT_FREE)
> +		return -EBUSY;
>  
> -	ret = i3c_master_attach_i3c_dev(master, newdev);
> -	if (ret)
> +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> +				     I3C_ADDR_SLOT_I2C_DEV);
> +
> +	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
> +
> +	if (IS_ERR(i2cdev)) {
> +		ret = PTR_ERR(i2cdev);
> +		goto err_free_dev;
> +	}
> +
> +	i2cdev->boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
> +
> +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> +
> +	if (ret) {
> +		ret = PTR_ERR(i2cdev);
>  		goto err_free_dev;
> +	}
> +
> +	return 0;
> +
> +err_free_dev:
> +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> +				     I3C_ADDR_SLOT_FREE);
> +	i3c_master_free_i2c_dev(i2cdev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev_locked);
> +
> +static int
> +i3c_master_retrieve_info_and_reuse(struct i3c_master_controller *master,
> +				   struct i3c_dev_desc *newdev)
> +{
> +	struct i3c_dev_desc *olddev;
> +	u8 old_dyn_addr = newdev->info.dyn_addr, expected_dyn_addr;
> +	struct i3c_ibi_setup ibireq = { };
> +	bool enable_ibi = false;
> +	int ret;
>  
>  	ret = i3c_master_retrieve_dev_info(newdev);
>  	if (ret)
> -		goto err_detach_dev;
> +		return ret;
>  
>  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>  	if (olddev) {
> @@ -1857,7 +2034,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  
>  	ret = i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
>  	if (ret)
> -		goto err_detach_dev;
> +		return ret;
>  
>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
> @@ -1920,6 +2097,50 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	}
>  
>  	return 0;
> +}
> +
> +/**
> + * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> + * @master: master used to send frames on the bus
> + * @addr: I3C slave dynamic address assigned to the device
> + *
> + * This function is instantiating an I3C device object and adding it to the
> + * I3C device list. All device information are automatically retrieved using
> + * standard CCC commands.
> + *
> + * The I3C device object is returned in case the master wants to attach
> + * private data to it using i3c_dev_set_master_data().
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> +				  u8 addr)
> +{
> +	struct i3c_device_info info = { .dyn_addr = addr };
> +	struct i3c_dev_desc *newdev;
> +	int ret;
> +
> +	if (!master)
> +		return -EINVAL;
> +
> +	newdev = i3c_master_alloc_i3c_dev(master, &info);
> +	if (IS_ERR(newdev))
> +		return PTR_ERR(newdev);
> +
> +	ret = i3c_master_attach_i3c_dev(master, newdev);
> +	if (ret)
> +		goto err_free_dev;
> +
> +	if (i3c_master_owns_bus(master)) {
> +		ret = i3c_master_retrieve_info_and_reuse(master, newdev);
> +		if (ret)
> +			goto err_detach_dev;
> +	} else
> +		master->want_to_acquire_bus = true;
> +
> +	return 0;
>  
>  err_detach_dev:
>  	if (newdev->dev && newdev->dev->desc)
> @@ -2101,11 +2322,15 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	i3c_bus_normaluse_lock(&master->bus);
> +	ret = i3c_master_acquire_bus_ownership(master);
> +	if (ret)
> +		goto err_unlock_bus;
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
>  		ret = -ENOENT;
>  	else
>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(&master->bus);
>  
>  	return ret ? ret : nxfers;
> @@ -2144,9 +2369,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	 * We silently ignore failures here. The bus should keep working
>  	 * correctly even if one or more i2c devices are not registered.
>  	 */
> -	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
> +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> +		if (!i2cdev->boardinfo)
> +			continue;
>  		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
>  
> +	}
>  	return 0;
>  }
>  
> @@ -2385,9 +2613,76 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	     !ops->recycle_ibi_slot))
>  		return -EINVAL;
>  
> +	/*
> +	 * If mastership request is supported, we also need hooks to control
> +	 * when mastership request can occur by enabling/disabling the event.
> +	 */
> +	if (ops->request_mastership &&
> +	    (!ops->enable_mr_events || !ops->disable_mr_events))
> +		return -EINVAL;
>  	return 0;
>  }
>  
> +static void i3c_master_register_new_devs(struct i3c_master_controller *master)
> +{
> +	/*
> +	 * We can register devices received from master by DEFSLVS.
> +	 */
> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_master_register_new_i3c_devs(master);
> +	i3c_master_register_new_i2c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +}
> +
> +/**
> + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> + * @master: master used to send frames on the bus
> + *
> + * This function is useful when devices were not added
> + * during initialization or when new device joined the bus
> + * which wasn't under our control.
> + */
> +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> +{
> +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> +	int ret;
> +
> +	master->want_to_acquire_bus = false;

Can you explain the usage of this variable?

> +
> +	if (!master->init_done)
> +		return;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	master->ops->populate_bus(master);
> +
> +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> +				 common.node) {
> +		if (i3cdev->info.pid)
> +			continue;
> +
> +		ret = i3c_master_retrieve_info_and_reuse(master, i3cdev);
> +		if (ret) {
> +			if (i3cdev->dev && i3cdev->dev->desc)
> +				i3cdev->dev->desc = NULL;
> +
> +			i3c_master_detach_i3c_dev(i3cdev);
> +		}
> +	}
> +
> +	/*
> +	 * If current master finished bus initialization properly, we can
> +	 * enable Mastership event.
> +	 */
> +	ret = i3c_master_enable_mr_events_locked(master);
> +	if (ret)
> +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> +
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	i3c_master_register_new_devs(master);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
> +
>  /**
>   * i3c_master_init() - initializes all the structures required by I3C master
>   * @master: master used to send frames on the bus
> @@ -2417,9 +2712,6 @@ int i3c_master_init(struct i3c_master_controller *master,
>  	struct i2c_dev_boardinfo *i2cbi;
>  	int ret;
>  
> -	/* We do not support secondary masters yet. */
> -	if (secondary)
> -		return -ENOTSUPP;
>  
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
> @@ -2432,6 +2724,7 @@ int i3c_master_init(struct i3c_master_controller *master,
>  	master->dev.release = i3c_masterdev_release;
>  	master->ops = ops;
>  	master->secondary = secondary;
> +	master->want_to_acquire_bus = secondary;
>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>  
> @@ -2488,6 +2781,92 @@ void i3c_master_cleanup(struct i3c_master_controller *master)
>  EXPORT_SYMBOL_GPL(i3c_master_cleanup);
>  
>  /**
> + * i3c_secondary_master_register() - register an secondary I3C master
> + * @master: master used to send frames on the bus
> + * @info: master info, describes this device
> + *
> + * This function takes care of everything for you:
> + *
> + * - updates this master info
> + * - registers the I2C adapter
> + * - if possible, populates the bus with devices received by DEFSLVS
> + *   command
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_secondary_master_register(struct i3c_master_controller *master,
> +				  struct i3c_device_info *info)
> +{
> +	int ret;
> +
> +	ret = i3c_master_set_info(master, info, master->secondary);
> +	if (ret)
> +		return ret;
> +
> +	ret = master->ops->bus_init(master);
> +	if (ret)
> +		return ret;

At this point you don't have enough information to do the bus 
initialization.

> +
> +	ret = device_add(&master->dev);
> +	if (ret)
> +		return -1;
> +
> +	/*
> +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> +	 * through the I2C subsystem.
> +	 */
> +	ret = i3c_master_i2c_adapter_init(master);
> +	if (ret)
> +		goto err_del_dev;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	/*
> +	 * If possible, request mastership and try to populate the bus.
> +	 */
> +	ret = i3c_master_request_mastership_locked(master);
> +	if (ret)
> +		dev_warn(&master->dev,
> +			 "Mastership failed at init time (ret = %i)", ret);
> +
> +	/*
> +	 * No matter if mastership takeover passed or not, add partialy
> +	 * discovered devices. We can register them when ENEC(MR) is enabled.
> +	 */
> +	master->ops->populate_bus(master);
> +
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	/*
> +	 * We're done initializing the bus and the controller, we can now
> +	 * register I3C devices obtained by DEFSLVS.
> +	 */
> +	master->init_done = true;
> +	i3c_master_register_new_devs(master);
> +
> +	/*
> +	 * If we are owning the bus, enable ENEC(MR) to let other masters
> +	 * initialize their bus.
> +	 */
> +	if (i3c_master_owns_bus(master)) {
> +		i3c_bus_maintenance_lock(&master->bus);
> +		ret = i3c_master_enable_mr_events_locked(master);
> +		i3c_bus_maintenance_unlock(&master->bus);
> +		if (ret)
> +			dev_warn(&master->dev,
> +				 "ENEC(MR) failed (ret = %i)", ret);
> +	}
> +
> +
> +	return 0;
> +
> +err_del_dev:
> +	device_del(&master->dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_secondary_master_register);
> +
> +/**
>   * i3c_master_register() - register an primary I3C master
>   * @master: master used to send frames on the bus
>   * @info: master info, describes this device
> @@ -2509,7 +2888,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	ret = i3c_master_set_info(master, info, master->secondary);
>  	if (ret)
>  		return ret;
> -
>  	ret = i3c_master_bus_init(master);
>  	if (ret)
>  		return ret;
> @@ -2535,6 +2913,16 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>  
> +	/*
> +	 * Enable ENEC(MR) and let other masters request mastership
> +	 * and initialize their bus.
> +	 */
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_enable_mr_events_locked(master);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +	if (ret)
> +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> +
>  	return 0;
>  
>  err_del_dev:
> @@ -2548,6 +2936,29 @@ int i3c_master_register(struct i3c_master_controller *master,
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>  
>  /**
> + * i3c_master_mastership_ack() - acknowledges bus takeover.
> + * @master: master used to send frames on the bus
> + * @addr: I3C device address
> + *
> + * This function acknowledges bus takeover.
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      u8 addr)
> +{
> +	int ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_get_accmst_locked(master, addr);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> +
> +
> +/**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
>   *
> @@ -2557,6 +2968,9 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
>   */
>  int i3c_master_unregister(struct i3c_master_controller *master)
>  {
> +	i3c_bus_maintenance_lock(&master->bus);
> +	i3c_master_disable_mr_events(master);
> +	i3c_bus_maintenance_unlock(&master->bus);
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index e089771..6ac9b46 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -421,6 +421,26 @@ struct i3c_bus {
>   *		      for a future IBI
>   *		      This method is mandatory only if ->request_ibi is not
>   *		      NULL.
> + * @request_mastership: requests bus mastership. Mastership is requested
> + *                      automatically when device driver wants to transfer
> + *                      data using a master that does not currently
> + *                      owns the bus.
> + * @enable_mr_events: enable the Mastership event. Master driver can prepare
> + *                    its internal state to be ready for incoming mastership
> + *                    requests and then should send ENEC(MR) command to let
> + *                    other masters take control over the bus.
> + * @disable_mr_events: disable the Mastership event. Master driver should
> + *                     immediately send DISEC(MR) command and can perform other
> + *                     operations. For example, recycle IBI slot if used before
> + *                     for MR event.
> + * @populate_pus: populates the bus. Called after bus takeover. Secondary
> + *                master can't perform DAA procedure. This function allows to
> + *                update devices received from previous bus owner in DEFSLVS
> + *                command. Useful also when new device joins the bus controlled
> + *                by secondary master, main master will be able to add
> + *                this device after mastership takeover. Driver should also
> + *		  update bus mode when I2C device is on the bus.
> + *
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -447,6 +467,10 @@ struct i3c_master_controller_ops {
>  	int (*disable_ibi)(struct i3c_dev_desc *dev);
>  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>  				 struct i3c_ibi_slot *slot);
> +	int (*request_mastership)(struct i3c_master_controller *master);
> +	int (*enable_mr_events)(struct i3c_master_controller *master);
> +	int (*disable_mr_events)(struct i3c_master_controller *master);
> +	int (*populate_bus)(struct i3c_master_controller *master);
>  };
>  
>  /**
> @@ -488,6 +512,7 @@ struct i3c_master_controller {
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
> +	bool want_to_acquire_bus;
>  };
>  
>  /**
> @@ -526,6 +551,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  			     u8 start_addr);
>  
> +int i3c_master_add_i2c_dev_locked(struct i3c_master_controller *master,
> +				  u16 addr, u8 lvr);
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> @@ -535,9 +562,14 @@ int i3c_master_init(struct i3c_master_controller *master,
>  		    const struct i3c_master_controller_ops *ops,
>  		    bool secondary);
>  void i3c_master_cleanup(struct i3c_master_controller *master);
> +int i3c_secondary_master_register(struct i3c_master_controller *master,
> +				  struct i3c_device_info *info);
>  int i3c_master_register(struct i3c_master_controller *master,
>  			struct i3c_device_info *info);
>  int i3c_master_unregister(struct i3c_master_controller *master);
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      u8 addr);
> +void i3c_master_bus_takeover(struct i3c_master_controller *master);
>  int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode);
>  
>  /**
> @@ -648,7 +680,5 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
>  
>  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
>  
> -void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> -void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
>  
>  #endif /* I3C_MASTER_H */
> -- 
> 2.4.5

In generally I found this intrusive for the current eco system.

I propose the following:
1 - Keep the function i3c_master_register() as is and go out before 
i3c_master_bus_init() if secondary master.
@Boris Brezillon is it possible to replace device_initialize() device_add() with device_register()?

2 - When received DEFSLVS commands add devices to a link list like 
boardinfo.
  Get bus ownership if there is DEFSLVS to add or secondary master not 
initialized. 

3 - When received ENEC MR
  Get bus ownership if there is DEFSLVS to add or secondary master not 
initialized.

4 - When secondary master became current master.
  Attach new devices to the host controller and retrieve device info 
(same logic as in i3c_master_add_i3c_dev_locked).

With this approach on HC side you just need to add the secondary master 
stuff without changing the current code and leave for the subsystem the 
responsible to manage all these secondary master task.

Let me know if this works for you.


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
