Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A10C3A5A6
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 14:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDC7215EA
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 14:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDI4eb+x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MMr5uGt0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="aCbbriIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECDC7215EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVIOhAYZutn3yen5IKlO0usI4U8KPM+QXW7ja7ZgqWQ=; b=vDI4eb+xTbYpog
	xtwAOUu3tSMqzzdIfowb2NYowt+fGiJexTsp9rQnf3Q5wnOffQeM/RL8+eXeYBYIsZbjj2eVQsfBi
	w9XLUkkJHvDwN9LVqG8fQHPaJzAVWH1YrFOiMHBGKfDK5yD5fvKTAjsybbCI1dgcjImuil+2Y+iPr
	hm4Wt92C/570gR21VWg3nHnfMP6P70bUUOOhoqw+AESUFu3lf0q2GAig6gKs16C+My4+sW+EUDy9t
	rXnWe0qR3e3ks9c970hnnqd8z2+VCDmt5s0/Xas46dev+E/scnGXZIcaBqpTY/Wbzi7VTLY/0/QGR
	UwDxFF9kAVr/zRS8gPQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Kym-00057J-JM; Thu, 29 Aug 2019 14:00:48 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Kyk-00056z-Gw
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 14:00:47 +0000
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 58053C03AD;
 Thu, 29 Aug 2019 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567087246; bh=rCptWp0xdou8NoY8S4W0EyKjcLsvKbN1bUGDHNhvVCQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MMr5uGt0EbUmjghl2Ddm/adn2Rq/T9yEA3HqN1yXQkXu7yGb8h4IFbN9pZLubhr/R
 X0sGG9cLw7EMlI6jjHc2vRY4FU24rTMa4i4bQT86AQ6Zv/3+jlI9gpQkSpYg8pmLI2
 bGlpMZKKXH91lZ165cJNc+zhi3a+WMvi9iP+qh/+JmJwws8zAjXI8N6qmlO1ZMnj3+
 LFkeid5tcwky1WF4crULD7SBBGb+n6eXG3myIiU4bA+nS6sWnEWLL+d91LBuk82qvx
 4vcjnEF2enGYQHqpSNGvPijx8GlFqKd/wXm588YWsa0h1v4RssecwksD1xhgfmgz7p
 OKh/tdmsgfETg==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 23D32A005A;
 Thu, 29 Aug 2019 14:00:46 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 29 Aug 2019 07:00:45 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 29 Aug 2019 07:00:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mbk3U70azJYppO459HJg9ZoeZ/up50EctgeWJ1hjPqalfRkI1D65xqSeG6vi5l91QSpxYcovhyIrOhEZzDG+awDx28k97FPQ0pYtYCaLcjxp8YaXSDqO85V+uYYhTkWkfCo6mQswfgWXwt1ZSGrbUMx4hcDMKk57fh5bmohoenzJgIpcjT1ypxoXugThDM4KLp+avzXN0G43D4UWWliBTJ6BMe7O7NoQgRr6wwp13/MMjJChkOWliOUHS0CZrZRQ3X0YeuQTOXeyKBeZq9gZoeUK+5dCfZLNZ8wLKPhX4RWFBImHKy37iPZ7TMwjDbgkA+OuAcEoemGh/sIwOR8wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OfwU6Fw66gnKEN3nT8jimXwGcR4QLS/Qf5R8n9Up9Q=;
 b=LgRAYVwK1ztKmpqCzMds0QxY9sg3yA1l9bVYxncS5ouM9M79XTVHl9kZ1A8SJPxnZ5V6+JiN/JqbOlj/T1+KtK4+MMqy8ARYL/4mJ6UlR0wzTAMmMT7L1HHFp891cLWioJ+l0gFy+Nu3l/CuOf1c492M3ekLuJprH/G4SP+EsGMH+/GVbj4vrDsL8FvGBTeJLSobOKsZMtNfS2x6b9qEoDmTFbq41VhdTaU4lyD8DSk17X72PuWGuiPHVrI4NU1VOKvAfRqyJiJi4OHY9vEQL1IEGC2rETMXOZLXm7YrO1yarDfWQ0qn1Y78mdJCa6XYQZU2gr0ilE9oRiudlKDciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OfwU6Fw66gnKEN3nT8jimXwGcR4QLS/Qf5R8n9Up9Q=;
 b=aCbbriIPv5tcrABTxaugTsXdYNqjesZTxZAgHQaUKAdFp0A2KRUYLjH6ReuxGpiGjn+0HDfjyfQo0MFvqXbwOG9QAPs5cApBL3J+qrv3mtCRY4CVQQIh3tQHTSpMoH921/dCHyvmNqnNdIGigsxwR78TBoP/Puo/IqNLfnK4BX4=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2815.namprd12.prod.outlook.com (52.135.107.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 14:00:44 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6%4]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 14:00:44 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 2/4] i3c: master: Check if devices have i3c_dev_boardinfo
 on i3c_master_add_i3c_dev_locked()
Thread-Topic: [PATCH 2/4] i3c: master: Check if devices have i3c_dev_boardinfo
 on i3c_master_add_i3c_dev_locked()
Thread-Index: AQHVXlJtbJoJFO7ydka+l2zwcEQXe6cR8PSAgAA0rSA=
Date: Thu, 29 Aug 2019 14:00:44 +0000
Message-ID: <SN6PR12MB265551F73B9B516CACB5B807AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
 <20190829124457.3a750932@collabora.com>
In-Reply-To: <20190829124457.3a750932@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNjFmMTUwZDctY2E2NS0xMWU5LTgyNTQtYjU5ZDc5?=
 =?us-ascii?Q?N2QzNzhiXGFtZS10ZXN0XDYxZjE1MGQ4LWNhNjUtMTFlOS04MjU0LWI1OWQ3?=
 =?us-ascii?Q?OTdkMzc4YmJvZHkudHh0IiBzej0iMjk1NyIgdD0iMTMyMTE1NjA4NDE5MjA0?=
 =?us-ascii?Q?Njc0IiBoPSJnc3BpUzBHcHp4aGNDc3o2T0dGZVBmc0NWa0U9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJD?=
 =?us-ascii?Q?Zmh3bGNsN1ZBV0JwQjVVWGZJSWlZR2tIbFJkOGdpSU9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 1c21017f-9d54-430f-2037-08d72c89490d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2815; 
x-ms-traffictypediagnostic: SN6PR12MB2815:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB28153556F0FEC8700DBFFC6AAEA20@SN6PR12MB2815.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(136003)(39860400002)(189003)(199004)(71190400001)(71200400001)(8936002)(110136005)(54906003)(5660300002)(186003)(7736002)(478600001)(256004)(5024004)(14444005)(66946007)(76116006)(8676002)(66476007)(66556008)(64756008)(6506007)(66446008)(102836004)(33656002)(53936002)(107886003)(52536014)(316002)(81166006)(81156014)(26005)(6246003)(11346002)(9686003)(6436002)(76176011)(4326008)(305945005)(476003)(99286004)(229853002)(6636002)(14454004)(2906002)(486006)(55016002)(66066001)(74316002)(7696005)(25786009)(446003)(86362001)(6116002)(3846002)(70780200001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2815;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G/pkRoUUis86N9kKXbG87L0fWPOxECmS5nfnrfaPv7YKl+ntVK2PaZwbZ5N3K6H/O6zAYIFO2n2Bdz2efc1SzvBkraN0K4/17DgyBUCuxYXc/u0YuJPeb3V+HEVTUk+40iKJ+tXdLS4ydDInBbE/xuPxUlZqOAG9TcJMc/0eQkzk4YZwl8bpC0VEuV6g5XbsVbUsAvBRwsBDZ6kEtGOwa1H6Ra1rxbjoZ0F+eAW/ahbTFrtfDm4inXopLLk4oE2z/v86wT0Rp9PfwL2z3VXmPVmOxNZgJO6HEtjrnBVFGOqi428Z5frrgW2vQUF/6LHpwXecMI3kRylchulSlYOL1o8Vs7m7gsGYwxmokbOaM2GVYI3wam9QNXzI+OC44zgooG1w6pFwLYteIxZ0MJEenymy2iMVNBX0XULT2R68MZM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c21017f-9d54-430f-2037-08d72c89490d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 14:00:44.3023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWw0dl9H8IM1X9FUvXm+KaFmrCd2+XtM2lAfM1iSiWL0JEsqSpubLO7LbK2D4QqOk24mnsNpy31FPt6J58QMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2815
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_070046_575666_347DB7DA 
X-CRM114-Status: GOOD (  21.01  )
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

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 11:44:57

> On Thu, 29 Aug 2019 12:19:33 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > The I3C devices described in DT might not be attached to the master which
> > doesn't allow to assign a specific dynamic address.
> 
> I remember testing this when developing the framework, so, unless
> another patch regressed it, it should already work. I suspect patch 1
> is actually the regressing this use case.

For today it doesn't address the case where the device is described with 
static address = 0, which isn't attached to the controller.
With this change both cases are covered.

> 
> > 
> > This patch check if a device has i3c_dev_boardinfo and add it to
> > i3c_dev_desc structure. In this conditions, the framework will try to
> > assign the i3c_dev_boardinfo->init_dyn_addr even if stactic address = 0.
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 4d29e1f..85fbda6 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1795,6 +1795,23 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
> >  	return NULL;
> >  }
> >  
> > +static struct i3c_dev_boardinfo *
> > +i3c_master_search_i3c_boardinfo(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > +	struct i3c_dev_boardinfo *boardinfo;
> > +
> > +	if (dev->boardinfo)
> > +		return NULL;
> > +
> > +	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
> > +		if (dev->info.pid == boardinfo->pid)
> > +			return boardinfo;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >  /**
> >   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> >   * @master: master used to send frames on the bus
> > @@ -1816,6 +1833,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> >  {
> >  	struct i3c_device_info info = { .dyn_addr = addr };
> >  	struct i3c_dev_desc *newdev, *olddev;
> > +	struct i3c_dev_boardinfo *boardinfo;
> >  	u8 old_dyn_addr = addr, expected_dyn_addr;
> >  	struct i3c_ibi_setup ibireq = { };
> >  	bool enable_ibi = false;
> > @@ -1875,6 +1893,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> >  	if (ret)
> >  		goto err_detach_dev;
> >  
> > +	boardinfo = i3c_master_search_i3c_boardinfo(newdev);
> > +	if (boardinfo)
> > +		newdev->boardinfo = boardinfo;
> > +
> >  	/*
> >  	 * Depending on our previous state, the expected dynamic address might
> >  	 * differ:

Best regards,
Vitor Soares


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
