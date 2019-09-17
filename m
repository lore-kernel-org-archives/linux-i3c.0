Return-Path: <SRS0=LhKG=XM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CA9C4CEC9
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2019 09:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3DE20862
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2019 09:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ROwSwEUb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MY/d8HlM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="TBK0XvN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3DE20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByyzINsLrP77uTZtxG5015v6nTnowEn+beBXNrv8oek=; b=ROwSwEUbpr6N/y
	s8ok4cGEBW4AKSL3UmilmJpHtDA8P7IfISLAhdoB9NW5/WwRrRoE8pekzl8NJcUDiu0bErkbKH+Ay
	489YovswAoeCeRq7obb/xKk9phAlGf2LCFA3SlBrxDx3L/NbKoRxsi8rfNIZUErGjkukog1W17fCI
	LevB5KbkCO8Ww3jm8TwL50cxNeRFVplJmZKW/3qQ2WhX6wOO+oadvCDwFQrKbm15fdyvE3+/SXjsX
	ah8oHmBuBk75P9RQjrNJnajTYvvHuCyXVKYAZFTLJUytarvVG3cbJZppVRBokPCZzxSmMlSnEAQON
	AlzPgIBZ2+r2lNoUTAbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAA08-0007XY-94; Tue, 17 Sep 2019 09:42:24 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAA04-0007X1-HK
 for linux-i3c@lists.infradead.org; Tue, 17 Sep 2019 09:42:22 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D8B7EC0E20;
 Tue, 17 Sep 2019 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568713338; bh=KkrEd5rUDdBh4ubpGkXg1RdoFwL5z1mrFl6FU99uM0I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MY/d8HlMqRgbZa2TlpC+GklFb5zci9xAmy7fp1I7AnVgw2N6ZYb3jDj7694zltgi0
 3hgBBABVld6GKUdfRSAlxCBtC3CqBEREbYg1vOQ71EbDOvpXYfdRACZha3Du75OFWL
 LMn6NVPpPCGODXvRBv0yUgIOpuf22M6+GCd6NBS/qKWgaDxheKTDVihIJYi6xf/CNa
 BPuH+Gr6dwm1NUVKQP4yvF/BS1UiFcmv00WlSuHHryf2XeMeGGQvMXlqPccjf/BbFM
 37fCG1DH6yKCo/XPz7QsDhoUbBgnc6b1MpnO9a2pBIdb7gSHYAfwx0Y/Ujs84e2ma8
 IJHsJ9rxcVBbg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B1527A00B1;
 Tue, 17 Sep 2019 09:42:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 17 Sep 2019 02:42:10 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 17 Sep 2019 02:42:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK6XdHzcRz0JegvQLhXH6DpLcBn7Tu4XdIkZKDELICehwdIdrWNEx+VQ2pbXSIeu4AwkmCmnI8z0YgeHswOtcdk8ihy+h/XJYpVFHeYc3RsFsYik8OO4wjOV5xozgYasanLCGHj1z7JZIVAJxdi2nykYllMd7Ovu7QDcrsH985B50WWtFMGGRdPbd8WXGij+CnpdIc4FvJxxOeVEWbn+8eu5OcKyo5i3zsRAHRZJBfXM6+YQNJGc8OmthZ8csvdA8mVV/mO81D+5gOOP7X+vrC6QTx7qSY8wuzklssdcJy69FQP73TtNf5aZunBN5G1uli0U7gckwwY++YvgyL4Gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7zXq4lALPPl+MdMDLZSefQBFim1u3CGB0dJ3ILdicY=;
 b=CtdQ9cxclG1CU8jxjS+RKZ6FTETWq86XafKRvHmr4rRoWnXTxz+wFwDohO0B+6R2j+qbuaJH/DX5AK7o6yc0MC3Fhl8oDb91Ft2MVFQkUcKoxVjWJb0WBHgu7gz+FYV2FykS6F9790UOBzULTF64VHX9DJXLV8Cgn8o65fKByX/sDjgoTYEFftsKm5ggPwONJpY5KPJGMy+7xGa0/6I5j4gU9YnGcxww5UJS0Pu6GWq5GIbVcmfPpshwHQ716Pf80Srmr8ayKSmMG7pXnlYwY1PqzMFbWxJNurHAuel9J+Hga3udBmDJmFJWy5H20kJwW9aGezHvXOGvGi4OzGYtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7zXq4lALPPl+MdMDLZSefQBFim1u3CGB0dJ3ILdicY=;
 b=TBK0XvN85CCcQU57M7EffwUPzG5DaTxZaiePO4eymwqV8w4U53rG2rueY9hRwVER0UGShQF+8i6kpV0npJuE2LvgqMMEGpIwD+Z0IG2u9hx5kJP67xs2z540YA2Z1EhRkN8n4Po2rTuQbTurkws+d3XF36oNMvEqpgy+PV9/XB8=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2767.namprd12.prod.outlook.com (52.135.107.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Tue, 17 Sep 2019 09:42:07 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 09:42:07 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: RE: [PATCH] i3c: master: use i3c_dev_get_master()
Thread-Topic: [PATCH] i3c: master: use i3c_dev_get_master()
Thread-Index: AQHVY9ofbg+C1bMU0k+qNlxSsKEUt6cvsIIA
Date: Tue, 17 Sep 2019 09:42:07 +0000
Message-ID: <SN6PR12MB265578DF9D15725F93D7E568AE8F0@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <a9d994b78d50a21e4eeb3a92004c56e68bb52e79.1567681102.git.vitor.soares@synopsys.com>
In-Reply-To: <a9d994b78d50a21e4eeb3a92004c56e68bb52e79.1567681102.git.vitor.soares@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNjczYTFkNGItZDkyZi0xMWU5LTgyNTktYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDY3M2ExZDRkLWQ5MmYtMTFlOS04MjU5LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTIzNSIgdD0iMTMyMTMxODY5MjQwMzA4?=
 =?us-ascii?Q?MzU1IiBoPSJTRjVJUm5mVlZmNHZOVEwxYUVHc2FGM0QxSDg9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUNE?=
 =?us-ascii?Q?c3BNcFBHM1ZBZFVSRFVoMjJjdHoxUkVOU0hiWnkzTU9BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQVZ6ZGhHZ0FBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
 =?us-ascii?Q?aEFHNEFZd0JsQUY4QWNBQnNBR0VBYmdCdUFHa0FiZ0JuQUY4QWR3QmhBSFFB?=
 =?us-ascii?Q?WlFCeUFHMEFZUUJ5QUdzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3?=
 =?us-ascii?Q?QUdFQWNnQjBBRzRBWlFCeUFITUFYd0JuQUdZQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxB?=
 =?us-ascii?Q?SElBY3dCZkFITUFZUUJ0QUhNQWRRQnVBR2NBWHdCakFHOEFiZ0JtQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFk?=
 =?us-ascii?Q?UUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBY3dCaEFH?=
 =?us-ascii?Q?MEFjd0IxQUc0QVp3QmZBSElBWlFCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QnpBRzBBYVFCakFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQWRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFkQUJ6?=
 =?us-ascii?Q?QUcwQVl3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCMUFHMEFZd0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWndCMEFITUFYd0J3QUhJQWJ3QmtBSFVBWXdCMEFGOEFk?=
 =?us-ascii?Q?QUJ5QUdFQWFRQnVBR2tBYmdCbkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpB?=
 =?us-ascii?Q?R0VBYkFCbEFITUFYd0JoQUdNQVl3QnZBSFVBYmdCMEFGOEFjQUJzQUdFQWJn?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQVlRQnNBR1VBY3dCZkFI?=
 =?us-ascii?Q?RUFkUUJ2QUhRQVpRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFjd0J1QUhBQWN3QmZBR3dBYVFCakFHVUFiZ0J6QUdV?=
 =?us-ascii?Q?QVh3QjBBR1VBY2dCdEFGOEFNUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHNEFjQUJ6QUY4QWJBQnBBR01BWlFCdUFITUFaUUJmQUhRQVpRQnlBRzBB?=
 =?us-ascii?Q?WHdCekFIUUFkUUJrQUdVQWJnQjBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSFlBWndCZkFHc0FaUUI1?=
 =?us-ascii?Q?QUhjQWJ3QnlBR1FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUE9Ii8+PC9tZXRhPg=3D=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cc0c88f-20e9-48b5-6674-08d73b534e40
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:SN6PR12MB2767; 
x-ms-traffictypediagnostic: SN6PR12MB2767:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2767AD6D386EEFF69AB72D0DAE8F0@SN6PR12MB2767.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(13464003)(199004)(71190400001)(6116002)(54906003)(316002)(110136005)(8936002)(476003)(229853002)(33656002)(55016002)(6436002)(7736002)(99286004)(7696005)(186003)(305945005)(66476007)(446003)(11346002)(52536014)(66446008)(76116006)(81156014)(9686003)(53546011)(74316002)(64756008)(26005)(66556008)(76176011)(6506007)(102836004)(66946007)(86362001)(3846002)(6246003)(66066001)(2501003)(81166006)(2906002)(8676002)(107886003)(14454004)(25786009)(5660300002)(486006)(478600001)(14444005)(4326008)(71200400001)(4744005)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2767;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tH5yvjEJ1w9B2tvUpq9kH1PmeX3JhLSQKyuoFPhAhJ0HSPyvWTVzwKtuKE+UNFWZuuJRTmCA/JofxiswJo6oZYZ90EcBRNSZ4Us94gDkG8fXp3zBo7ikRMQpCZ7fybN1MZ+DsB9pmxcVA8gl0hqd9/NPIp/S2hFAxa7xwIr6g+nswk0TrfqIQhjV6ehLGeEYpkxv1MWxzGb8YhZXcJbQh9NB6JsqNsuXUDEQUJLXvAjxI+BuU424qncMNlFzA/YlKPvUl+HqFB7x9Py8/R59f+4EBa4jLyT38B3Z8nB8OVutWF6YeOvF8zy3Hig69eZOGiOTHzAnpdVKLFGJXYIqJn4A0XgBec1tUp/lRJVo0LDav5penXZFkXp7Y0nXsEB+lEvExcX1EHpzzPRXnpfNl0hfpDpAR2REb5FmQI+K9zM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc0c88f-20e9-48b5-6674-08d73b534e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 09:42:07.6472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjWRNxp8d21robLEV4qqen+66MSvMrUgqYj0mb+ydE9t3pDaWq9kcqrqUR7Sa/lCRCMjd32BMGQz7J37QAA46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_024220_804939_90FC9F23 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

Friendly ping.

Best regards,
Vitor Soares

-----Original Message-----
From: Vitor Soares <vitor.soares@synopsys.com> 

Sent: Thursday, September 5, 2019 12:07 PM
To: 
linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org; Joao Pinto 
<jpinto@synopsys.com>; Vitor Soares <vitor.soares@synopsys.com>
Subject: 
[PATCH] i3c: master: use i3c_dev_get_master()

Since we have i3c_dev_get_master() available, use it.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 
drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5f4bd52..d54039a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1779,7 +1779,7 @@ static void i3c_master_bus_cleanup(struct 
i3c_master_controller *master)
 static struct i3c_dev_desc *
 i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 {
-	struct i3c_master_controller *master = refdev->common.master;
+	struct i3c_master_controller *master = i3c_dev_get_master(refdev);
 	struct i3c_dev_desc *i3cdev;
 
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
