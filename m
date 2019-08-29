Return-Path: <SRS0=etNB=W2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24092C3A5A3
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Aug 2019 05:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C32208CB
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Aug 2019 05:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVP2/SzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SGaKHz2t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="OIxiyaCL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C32208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLqBoerbOpct6s1l/jgNq3SNZMsHy0z1bG/lbUXFwh8=; b=JVP2/SzYNVFaBL
	G6Ni6v7mkuT4mvk43TJrz/CNuI03vxbl+o7SMQgrLCd5+mlOQh0yaC7cF9FGGQghk7Kc2RQnJAfPf
	XdCKJBXnMkp0oLGx86rMMYWrQEoO2ip6vz1M/K1nQlMEVxVznGkCjvIHJyJ1kR32JFDaihGw9QaRo
	NC1nBM1hAjOZFIyIR3iVYMJx4C8nnO8Y5Iw3ULjFRClqHD4Rvk3bsMm0f4eSJnIWIHvahoNJMPaPt
	RUvC9GTa7YDTiGMUZbnmvEvWFcFuuQHrTojWls0lqa6u+8YQGAjEimcoMmD2zp8zr4FwK6A4Ti5aQ
	F6+7lYTJ8TgjJWl3MuOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3ZvJ-00078A-6Q; Fri, 30 Aug 2019 05:58:13 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.61.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Krl-0000mq-Ek
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 13:53:35 +0000
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9CA54C03AB;
 Thu, 29 Aug 2019 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567086812; bh=JsJdlEONMmTeB2Vxdzi/PkiAc9QygfJIFhRh+CXvFQk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SGaKHz2tSLRNalk7dyhGlytRxymzXIi307AF79Hc12ME6tS3ER8A9039hTi0ged3f
 utESmElCN1LHOug8tLmqty6kX9n2HwpRnZZw5uYYvatvQPy+/K4Jw1rMTILx1qtDIR
 VNLbpcPe55+erl3tMv1RylIzNMdIsvM6HoYaPE3m5C4gXxR4hCKuD6v/sTw+ilbCOI
 ahrIDcGDy3fwVGoFtsYjHyIjeluivF/PjvN/qpHbq3632RiZY1fuKSBoqBX2bc5JjC
 4C2CDhVAbOfmlXiawB/YbwxjvbIhOZgHTDd67z3aVA1e35qjlSg67Y+eUOA67z5osN
 wtbiC9H1Se68g==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4F3CCA0069;
 Thu, 29 Aug 2019 13:53:26 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 29 Aug 2019 06:53:25 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 29 Aug 2019 06:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vgy0lBNkr7q8LKb10GU6wKTeUgw63uRoEq5ifHc0kY4wSepeX9XbGIN0sDNUfS7k80k12nE0/E8pq2WhHYwobO+NnjNGCR6ljtgFwzzhP+IDLG+/JqJYbU/8A2EPzgb422/Yl2lnj75J2u3ftbxYiUMLk/LnSHWmJ08sj0JJIB7+HGACIKcz5pvA6EhZgOscI0KhyegOmnkizPqy6k+t65dMn/ifGWWUr2784wl0rCAunTRgMDCD8OfYC6AJQKUhhvLctExUpqOccaUwsty7OhK7sWE/2dti033dcFkMahkxXTAPoELrbV1qvxt1f006tva3/kzgfGb3jNGl8lE/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwpabfySwAJhQuu/QtFsIRHc2vxi1zALBPAbed2/Jhc=;
 b=AfwVTPwpOksC2edkTDVetxV51l99NW1j1lS4udzarDR7rc6X9IigfWzDg79g+rDG+QueYvGcogFjoj+bOtcub7VusVahTOVrlvRyAyZSv3uvhYmhHUA9grnkc0HxJwdY/zfuJFNu5d7vb0ZkbtclfM/NO202c5LA+8JKEF60rr9BUpQ5BPN/UPKv19QROf8zWtGR1U3gJx2YJimoqqDDKRaHlwYRCwwZZidC495mC3N+P7YTMWmsOJ+23EU8Ys/9eDO4xjCySJTj5oyCub8cfTBTJ9WF6EgEcpLoGHRywuVozNwWNxf/UW79u8LqplIjYXPebzKQE21wNkXMoXPL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwpabfySwAJhQuu/QtFsIRHc2vxi1zALBPAbed2/Jhc=;
 b=OIxiyaCLkZV6nQBmupa/tisOIpwJpI0QDxy1JuVxxH7NwUXYj8TyhY9Rny0LUCJJbtOAHGKhQ895RDoC5L1IHw/qtZqxP7Jt2H9ZIj6PJzoOy9bKdoZrBs50hJHeNTzQzbvNYADn6jiJdvi8+NasPgSi9WeszkAHN/gpX1tfpQA=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2814.namprd12.prod.outlook.com (52.135.107.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 13:53:24 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6%4]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 13:53:24 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Topic: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Index: AQHVXlJs0CsMPtNc5UG5qMD4ebbBaKcR7+uAgAAtCrA=
Date: Thu, 29 Aug 2019 13:53:24 +0000
Message-ID: <SN6PR12MB26551F172804D039F3EAA991AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
 <20190829124115.482cd8ec@collabora.com>
In-Reply-To: <20190829124115.482cd8ec@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNWI4YWY3Y2EtY2E2NC0xMWU5LTgyNTQtYjU5ZDc5?=
 =?us-ascii?Q?N2QzNzhiXGFtZS10ZXN0XDViOGFmN2NiLWNhNjQtMTFlOS04MjU0LWI1OWQ3?=
 =?us-ascii?Q?OTdkMzc4YmJvZHkudHh0IiBzej0iNDY4MCIgdD0iMTMyMTE1NjA0MDIxMjAx?=
 =?us-ascii?Q?ODIxIiBoPSJCbzhGNndLQjczM0FDWkxTK2s4M0tOcmorb0U9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUNk?=
 =?us-ascii?Q?Uy9nZWNWN1ZBUndxa0tkalNWSCtIQ3FRcDJOSlVmNE9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 2297797e-8723-49be-6749-08d72c8842df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2814; 
x-ms-traffictypediagnostic: SN6PR12MB2814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2814B16302CFB6753FD99DF4AEA20@SN6PR12MB2814.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(376002)(136003)(396003)(199004)(189003)(256004)(52536014)(99286004)(9686003)(5024004)(14444005)(186003)(14454004)(81166006)(76176011)(81156014)(55016002)(8676002)(7696005)(6436002)(8936002)(110136005)(53936002)(26005)(478600001)(102836004)(54906003)(316002)(5660300002)(6246003)(2906002)(6636002)(7736002)(66556008)(86362001)(66476007)(66446008)(446003)(64756008)(66946007)(11346002)(76116006)(305945005)(3846002)(66066001)(4326008)(6116002)(486006)(74316002)(71200400001)(71190400001)(229853002)(33656002)(25786009)(6506007)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2814;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +znr6OftFRlq/jO47ZSYGdWR1dHGZsdMwO/YzekYOmenmTnqPy5M7qVcOcP6u2CfWBE7Z95oann2sakoiDSVbcH4cBoyvNTU4xEz6/KUx24jwSMCdBIh5Ko6xOdE1DWxoUUD35KaRBFRi3FVgknwpBDl6reC7Ox++siA8RNm9T5LTlixziN+P4MoT3KjxgSkCJoref19i548Ccr/WQNoGc5m9e4X2Y7ANpRwToSAkrvHYJga69ynRo7oUlwu7oGriZadty8tqszvxiMAQ5jhDzScrOuoC3n79jYkI+Fzli1HjFSzOKuVTlvlQrTTSbvwcUD6s4QpddE8Zs6Ik4wFyXpjIOY33h41b0gUtTmKdbk6uX7R1QT1ZgWTOKiKiKowAZAm347Z9EfcZ0rUVv7abpjvwqz8QAyAZ++7ZSHD6d0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2297797e-8723-49be-6749-08d72c8842df
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 13:53:24.4236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Td9C1Zp1PbG41sJh6NxUqg5dagjT6cO35ycMcCwb77nVIEDa/OMz7QT/YwWT5XiNKeVxV+cQf9HZfHusj9G2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2814
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_065333_565725_81508228 
X-CRM114-Status: GOOD (  15.32  )
X-Mailman-Approved-At: Thu, 29 Aug 2019 22:58:12 -0700
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
 Przemyslaw Gaj <pgaj@cadence.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 11:41:15

> +Przemek
> 
> Please try to Cc active I3C contributors so they get a chance to
> comment on your patches.

I can do that next time.

> 
> On Thu, 29 Aug 2019 12:19:32 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > On pre_assing_dyn_addr() the devices that fail:
> >   i3c_master_setdasa_locked()
> >   i3c_master_reattach_i3c_dev()
> >   i3c_master_retrieve_dev_info()
> > 
> > are kept in memory and master->bus.devs list. This makes the i3c devices
> > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > detaching and freeing the devices that fail on pre_assign_dyn_addr().
> 
> I don't think removing those entries is a good strategy, as one might
> want to try to use a different dynamic address if the requested one
> is not available.

Do you mean same 'assigned-address' attribute in DT?

If so, it is checked here:

static int i3c_master_bus_init(struct i3c_master_controller *master)
...
	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
		struct i3c_device_info info = {
			.static_addr = i3cboardinfo->static_addr,
		};

		if (i3cboardinfo->init_dyn_addr) {
			status = i3c_bus_get_addr_slot_status(&master->bus,
			^
						i3cboardinfo->init_dyn_addr);
			if (status != I3C_ADDR_SLOT_FREE) {
				ret = -EBUSY;
				goto err_detach_devs;
			}
		}

		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
		if (IS_ERR(i3cdev)) {
			ret = PTR_ERR(i3cdev);
			goto err_detach_devs;
		}

		i3cdev->boardinfo = i3cboardinfo;

		ret = i3c_master_attach_i3c_dev(master, i3cdev);
		if (ret) {
			i3c_master_free_i3c_dev(i3cdev);
			goto err_detach_devs;
		}
	}
...

and later if it fails i3c_master_pre_assign_dyn_addr(), the device can 
participate in Enter Dynamic Address Assignment process.
I may need to check the boardinfo->init_dyn_addr status on 
i3c_master_add_i3c_dev_locked before i3c_master_setnewda_locked().

> Why not simply skipping entries that have ->dyn_addr
> set to 0 when preparing a DEFSLVS frame

I considered that solution too but if the device isn't enumerated why 
should it be attached and kept in memory? Anyway we have i3c_boardinfo 
with DT information.

> 
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 5f4bd52..4d29e1f 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1438,7 +1438,7 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> >  	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> >  					dev->boardinfo->init_dyn_addr);
> >  	if (ret)
> > -		return;
> > +		goto err_detach_dev;
> >  
> >  	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> >  	ret = i3c_master_reattach_i3c_dev(dev, 0);
> > @@ -1453,6 +1453,10 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> >  
> >  err_rstdaa:
> >  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> > +
> > +err_detach_dev:
> > +	i3c_master_detach_i3c_dev(dev);
> > +	i3c_master_free_i3c_dev(dev);
> 
> We certainly shouldn't detach/free the i3c_dev_desc from here. If it
> has to be done somewhere (which I'd like to avoid), it should be done
> in i3c_master_bus_init() (i3c_master_pre_assign_dyn_addr() should be
> converted to return an int in that case).

I can change it to return an error. 

> 
> >  }
> >  
> >  static void
> > @@ -1647,7 +1651,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	enum i3c_addr_slot_status status;
> >  	struct i2c_dev_boardinfo *i2cboardinfo;
> >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > -	struct i3c_dev_desc *i3cdev;
> > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> >  	struct i2c_dev_desc *i2cdev;
> >  	int ret;
> >  
> > @@ -1746,7 +1750,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	 * Pre-assign dynamic address and retrieve device information if
> >  	 * needed.
> >  	 */
> > -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > +				 common.node)
> >  		i3c_master_pre_assign_dyn_addr(i3cdev);
> >  
> >  	ret = i3c_master_do_daa(master);

Thank for your feedback.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
