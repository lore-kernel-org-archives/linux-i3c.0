Return-Path: <SRS0=w6fK=ZD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3C7C43331
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Nov 2019 12:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A353F2196E
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Nov 2019 12:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmwD77AY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EUEABoTj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="SUqdaKX3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A353F2196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/3wgqQ/qrtcc09pThgU1hrpawAcP8g+JpD6FaT+HQc=; b=pmwD77AYlDY257
	0dHYaJSNNPLwR6I/yJ4L/ycTQeb9gmpJXuqWy7CwbX8aZnTqRrcICfTD0DiL3Pk7H7r1usc+HkaUw
	5U3xqmv12XsMx2AEARrlowCnfegIdeolNxB77c0y9pJrF0NpA7gWACjbkWaZTbXW+QN2z90VPAcXL
	23f1LWfQf4cw5z4D73iaS2VxykhserKwrTtpRPxLg1pNvl1tt9uQLFj/ChTTlDkNldCUt+/eGxUbD
	TEQsvr/bZsbJUvxNS9j981BLHIwbRposBett1fES+ZyWrVEJt3QKRpmTMiXJRejmNrcWYx2m0+Ynu
	kTnjWa66ul8hPJWX304w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU8qV-0003fN-AZ; Mon, 11 Nov 2019 12:31:03 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU8qQ-0003eq-8a
 for linux-i3c@lists.infradead.org; Mon, 11 Nov 2019 12:31:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 94408C0388;
 Mon, 11 Nov 2019 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573475456; bh=hKaulzDb++5DnbaBGmvGd0rFT+xp7bkHXzjW5dZ46AY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EUEABoTj9FcK/Sn4CgayYmo6yTvOEVPdiaiQcLWEGRcihuJUmzrNxsXFXWcNAIwrp
 V+ex761gSJYIMNWGeahzRgajnyxk0rnivaZ/DpjOZoVlI1OPm+/n4Jsm3aS1zZmTqG
 EezZ13swNnKDH0yX2Mbv6lKXYfTmhxZ+kCnzTmGW9pSq1PDxn272S0JwB++n85AASf
 3bia+sH5M5nrzJbmRht61SlZKJN91mtfo0h3Z+/c9WYV5DFWg7qVNRp743nVaX2eAU
 j+KNw6R1Kovt95iYfzDyGPlgl8DJeR+wZlNscJ2y25Innxa5nd/XcQ8N1cGj0ZVEmR
 AFjoOgSQhwUJg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C5218A0085;
 Mon, 11 Nov 2019 12:30:48 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 04:30:48 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 04:30:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1NJXKuMuOmEnsKxO+zO+1gmrsC+0HTvXY8HGpmgn2rV9aj0cq77SfLI/p4brO0eyMKqdZ+gdjGnSBeuikuOsanu6wysGcnBTw5NVBrJBOqrihrYyw1mzs5y03xV35/TO1tjAQ6dKn0YfiZmPTwKcA5voo1HQQI0vtnfLCKXwB9b6y9kEQFsUyonH3KE1ideAtUMTl+nAj44sEvXmbTq1DIGrXevruRoUG6yINsMvubas4pG4BHnBKnROaoZvwLjC0Fdgx9MkmBPTCaGHgUa7UEzwAfQd3TQ5L2HV0D3UkwpQs1aqCWIZJaxqMlHOeesffOPXG+yhgAbJAnx2PeW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlvIVCmW77sDExGPZdz7sWM0XA0OUh2LC1CDfo3W/wc=;
 b=D2zaEInQH5YcovjU/9OaLf0oAdj1ZDgzHRelNf6B6f7Fi8IOdtku64nXWhijHUmHDbJiXVzPjyqUMrw+KYEROqTzLeKSckS5EJovJqhy2fT2sPfSYvwLz4g8TB+DXGmXknCho80ZfGnUYY1GV4oqZQtRb4Ce9+Dag8o8b886w0o37yEnFfnRui4IYswlwOEEJM0ZcjCAeJ3/mYcXzyBDQu8fIFDgNYSaWD+drFfHKa5GyRYEhGZZGXCc8rxWEgf/2nKH3Vt7xildnqPbiueTctxKIzjYo2RIk0niYlDTShmafaQZT/AeVx1aPMQhOrUpvt0GREevjJsX//S25ir9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlvIVCmW77sDExGPZdz7sWM0XA0OUh2LC1CDfo3W/wc=;
 b=SUqdaKX3hN3saJrOuBjR9g1GEpmCOgDkfQK1yvctXoAHeGneNdoa5cHag9A6O7JslkWDm3oMlyUCvAT8HpWUMZ2iWiGiXPpF/jVx4IqkWzv1yOn3/TviNDf0e/RrKjrEiHh89rKut/XKn6Hs0kdOV9R4vcP0UsNbtqGUnFUENxk=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4295.namprd12.prod.outlook.com (20.180.6.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 12:30:46 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 12:30:45 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Przemyslaw Gaj
 <pgaj@cadence.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeA=
Date: Mon, 11 Nov 2019 12:30:45 +0000
Message-ID: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
In-Reply-To: <20191110113005.57dcff8e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMTIyOTNjODctMDQ3Zi0xMWVhLTgyNjQtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XDEyMjkzYzg4LTA0N2YtMTFlYS04MjY0LWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iMjcwMyIgdD0iMTMyMTc5NDkwNDMzMjQw?=
 =?us-ascii?Q?OTI2IiBoPSJEOFMvNms1T2o4N094c212cTQxMUJqbnhrYUU9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJl?=
 =?us-ascii?Q?ajkzVmk1alZBUWdFZDhyKzdVVEhDQVIzeXY3dFJNY09BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQWt4V29sUUFBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
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
x-ms-office365-filtering-correlation-id: cdfe2bb7-0fe9-4657-5a56-08d766a2f9d8
x-ms-traffictypediagnostic: CH2PR12MB4295:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4295D95A7FD5DA962B5F3846AE740@CH2PR12MB4295.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(376002)(39860400002)(366004)(43544003)(199004)(189003)(316002)(110136005)(478600001)(7736002)(229853002)(305945005)(74316002)(8936002)(14454004)(8676002)(52536014)(2906002)(54906003)(3846002)(6116002)(5660300002)(81156014)(81166006)(99286004)(25786009)(86362001)(446003)(4326008)(11346002)(26005)(33656002)(6436002)(66556008)(7696005)(14444005)(6506007)(561944003)(66066001)(476003)(76116006)(76176011)(9686003)(55016002)(71190400001)(71200400001)(186003)(7116003)(102836004)(66946007)(66476007)(486006)(6246003)(64756008)(66446008)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4295;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h1qp46I6amppU9x8giMp1Tpp2FXKWTqTiy7KAPd2kP7s4ov8j/g6k2PnukAWY13VvsWCQgfImU5Ullh8r+iV1mQ5JXdM4AvCoCP3nD038c4TgAih5jnnYTQzYfh20WdRlvc1Uq+beBoOE/Um6x/8vDXP2zmMK8wgcU0GIsDvv6rknS2p2EVvVhRDiUovCLzBhfrimbh/ClTsQlZL7/xyGIr4BtkVuaEfNc8dmDm2KJXJHtpH1s4uA/P6udb78FbPsTZxzzKiHN04dRRV/0Za3C3yFgHscTXxh6YxZw7jCgU6feOW18vCSd8B/6yjdgP6TABwvCczSpf6VV4MFLl4MGXavvKl+8Dm0N3Sls0D4+sWckK9cRRJXJ3YNyvFFM+7d75Qu7lOyLhwk/TzGFySMl5Mq9sY02K36jimcMevK/vuL1gTqrM298jTnOU0/6L2
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfe2bb7-0fe9-4657-5a56-08d766a2f9d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 12:30:45.6893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFiFOdj4x4iRFWSw8HR+FFO07qDUJK7M1YR0t/qU76jWWv9ZdMfBwBv3YZRucXXCI14ri2///noqah3hxYngnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_043100_644661_5FD082F2 
X-CRM114-Status: GOOD (  19.94  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "Vitor.Soares@synopsys.com" <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris and Przemek,

I have a working version for tests purposes. Yet, I have some basic TODOS 
to address during the takeover of the bus.

I don't know if you are aware but the secondary master feature 
description was improved for the spec v1.1 and it makes sense to take a 
look on that.

Regarding the current approach (at least last Patch series and what I 
did) I still don't know if it is the best solution.
I remember in the beginning of secondary master support I discuss with 
Boris about USB OTG vs I2C slave mode and now having a better 
understanding how USB OTG works I think we should address secondary 
master in a similar way. At least for me it seems to be more modular and 
ease to expand.

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Sun, Nov 10, 2019 at 10:30:05

> Hi Przemek,
> 
> On Wed, 6 Nov 2019 10:33:16 +0100
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > Hi Vitor,
> > 
> > We discussed with Joao in Lyon that you are ready with mastership RFC.
> > The question is when do you think you are able to post this proposal.
> > Our customer needs that and is pushing hard. I would like also to run all
> > the tests in our complex configuration and check how does it work.
>
> If you need this feature, I'd recommend that you lead the discussion
> (as you did so far) and post a new version. Maybe try to address some of
> the concerns raised by Vitor along the way. I know that you were in
> favor of getting back to one of the previous iteration (discussed
> during ELCE), so please go ahead and do what you think is the more
> appropriate.

I will try to put everything together and send a version so you can take 
a look.

> 
> As part of this work, I'd like you to look at how mastership handover
> is handled in HCI. I'm not asking you to implement an HCI driver, but
> having an idea of what would be done in each of the new hooks would be
> good (and maybe describing that in the cover letter).

We may need another call back for "deliver mastership" because the way 
how controllers do request/deliver may differ.

> 
> Thanks,
> 
> Boris

Apart of all this it necessary to think how request/deliver will take 
place in a functionally system.
  - main master just deliver the ownership to secondary master and expect 
it take care of the bus.
  - secondary master request the ownership and automatically send back 
the ownership to the main master.
  - give a time window in which each master can own the bus.

All this are topics that I'm going discussing with people that are 
working with i3c.

Best regards,
Vitor Soares


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
