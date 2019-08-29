Return-Path: <SRS0=etNB=W2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459CDC3A5A6
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Aug 2019 05:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC5D2186A
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Aug 2019 05:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q0x9FW4w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OHRhgG4f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="DuoQd+d7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC5D2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oywj57Indx3coHwLILozFW3/Cq02QX/Y8cmismHaz9E=; b=q0x9FW4wr/Taac
	vYoHRSJZRAFLbWo35PZPIMTuoUyETQcPRLbFTXKvFqFrweoh6az2mzdGnNIPiXt8y3JJ6ab0gMWC1
	GrVp3DHdkuBJE0LXeEfFQh+mzexh166ZGjxA+DkKjCZMcqT5K9TBJKkdeQhDapQG2E8Ag+6wHQil7
	yfsXwjShxaxxb+R8oeM1YSTzjBPsz9TeJa3zayxjGx6awQyIDn6AkMclOu0QM1HYddYTHzq+tnar8
	Kb0jen1L2jes1Td0r0QxFYqGQbkQypk7KmLc5MiXfi7ndvUXaMK56eGJV+Cyhc3sBwrC4m2Knyq5Y
	PPe4ce6LoOVPeeqAlAsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3ZvJ-00078N-H1; Fri, 30 Aug 2019 05:58:13 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MHJ-0007Xy-A8
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 15:24:03 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DE0E5C0372;
 Thu, 29 Aug 2019 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567092240; bh=zwEU7qUb5fihVZ3baeD4aSU2Qd89CKIUHDF0TR2ikzM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OHRhgG4fyURLUL/m3YiAn9pvIEBWReqAPpmZoCvI/wL1yAz/tfvy9ZjDsid7gFeL1
 I2wZs57aWg4A3ZMiBzioFodoNd84jfRATD/iqPdNcCvBzP28Hi5BLSgvcMAJepRvW4
 xy7ewaMZxoC43W9mzNXciTa8s4QFeePiLLEymHgMS9MncMYTHtMcMYDhOyQJImybtT
 DqiNBxsim9Cq7IZ3hdyryGB62YRR9wcHNX5Tao61S3r62jiC4o+84eMvsO6ElNre66
 UXATY/jUIrRAMrwgYd+jo3EsxzUXxfzb7BFNEwLNgO/orAKPnogsHeXrZHxf6G/JqV
 lvAJZ5+6ZxNSw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1D182A0080;
 Thu, 29 Aug 2019 15:23:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 29 Aug 2019 08:23:32 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 29 Aug 2019 08:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8OKQdYMNR/K5fTwmrt9Ci1XkBjVzJ/Q6TzV7RoQHodp8Tp73g9rXzdkbJnT+oSpQ6F0fgVH1xRQojt+7W7HoN0UxR8Q1OiA0z3QlZTVFVbgD5xBCyhueg3W+nkfhawnS1oQ4eowp9GuFQa6LqmxHI1KA+4bGu6+VHbiEIADCroBt5VLYd6T6Ev2cc68H7cQ/v+I0TVpP3vXgGaCIUPmdBVBC2AIM6z2YZKhpBSaTlGNgzRGyXVsnTyxDmFMRxyd5BLGGvwE+ctniclrvS2iyHb7DAhP3DtXm9/NcW/P8l5k2VfKTUtXcOMccCvDeqhV66dxtFy/TM8DAeLSyaxd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfmMsTldpOpf04ZZxOaV8FM1mQdzmnUSUm3kJUYdnJ4=;
 b=SSg3xJWyYVWuzZ0xCCPhgQ7EeyUkrbES/dmytO5a8+zYqXOrwxoZgc7mhfTxywhZnHwlEQSJuFd9a8h5oPGiMC3xL8nVoT3lltgkjsEBZsviLZ8sb0oG4r3DoKfc+4BvLHtyc/w2aBmx4X4VPuFszqfG22Un9VEdBNFkpOXcG7RR6iHHEqqtQSX6mYiTQJgVkHsTgN6oRJo+Brk3rsWvvurnPsSQ/0plTRzgu/gV8qQ8l/BN2Wu4sZlFpFNn4EiBA1H9fhUWSm5iIv/nQlLhxcHPGRaQIZmqLepyRErEGCE0qsnF31ta7ys/QgnL2NFH1KRtFOcaQvDu1I3h7eC4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfmMsTldpOpf04ZZxOaV8FM1mQdzmnUSUm3kJUYdnJ4=;
 b=DuoQd+d7dd/hd2kS1PDvDKmhlLCdqId8xph4ZjkWIXfVrBtZcLAWBuq96IzqLE7n4u9EaZqWNS0+kpA1CtnSXy8RMcJ6oOuADlpZ8ATFejZqtvLviCPV35k+kATqPxGzpf8skAXnzRhZLTS/ZkNJlK1IHmHMBIHfRHWMphWQCUs=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2782.namprd12.prod.outlook.com (52.135.107.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 29 Aug 2019 15:23:30 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6%4]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 15:23:30 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Topic: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Index: AQHVXlJs0CsMPtNc5UG5qMD4ebbBaKcR7+uAgAAtCrCAABRdAIAACbBQ
Date: Thu, 29 Aug 2019 15:23:30 +0000
Message-ID: <SN6PR12MB2655E9E544D7E96323BAC796AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
 <20190829124115.482cd8ec@collabora.com>
 <SN6PR12MB26551F172804D039F3EAA991AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190829163520.126d42d6@collabora.com>
In-Reply-To: <20190829163520.126d42d6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctZjFkYjc1MWMtY2E3MC0xMWU5LTgyNTQtYjU5ZDc5?=
 =?us-ascii?Q?N2QzNzhiXGFtZS10ZXN0XGYxZGI3NTFkLWNhNzAtMTFlOS04MjU0LWI1OWQ3?=
 =?us-ascii?Q?OTdkMzc4YmJvZHkudHh0IiBzej0iNjQ2OSIgdD0iMTMyMTE1NjU4MDg3MjU4?=
 =?us-ascii?Q?NzI1IiBoPSJNTkJVT01NTlJ0SEVCVDJBYXZwWm1kMENRbEU9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJs?=
 =?us-ascii?Q?Mm82MWZWN1ZBZXp6TXM5bXFQVHM3UE15ejJhbzlPd09BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 6e1e2795-a4a4-4158-7252-08d72c94d954
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2782; 
x-ms-traffictypediagnostic: SN6PR12MB2782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB27826605A43F42138F04D8FBAEA20@SN6PR12MB2782.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(52314003)(8936002)(6436002)(52536014)(14454004)(6116002)(33656002)(2906002)(81156014)(25786009)(53936002)(6246003)(316002)(54906003)(4326008)(5660300002)(8676002)(110136005)(476003)(478600001)(229853002)(486006)(86362001)(7696005)(76176011)(66066001)(6636002)(71190400001)(71200400001)(81166006)(76116006)(74316002)(7736002)(14444005)(5024004)(9686003)(66476007)(64756008)(55016002)(66446008)(6506007)(256004)(66556008)(66946007)(26005)(11346002)(446003)(186003)(305945005)(102836004)(99286004)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2782;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bobv8tDrRVOtIf/bXRg8L9CC+nw3pYnzDxdfqAh57CIfJT884H6pp6eUbrnMbjAwf3FAUMl7yRH5lH3huRTelaC7lVJvFUKc/+GOtDFR/xPhKS0TyoSPXPC8RTtBVdIxB79i05IO/sCpXxEqKdW9jqdktu/v/ou4Oq/KjoCOKVB6NixoY1fcqy16ULJNi0W54N1W1kxRT9Dl8f1EIpxub20zCYFrnCvH+pBW2fnwHz/nEcchhfHNzgfU/THGIc9VoF6iyvoPZbeX8vPOeRZkppDhzk7phGPoji1iAN++WERCGf1P45z0N7pvbp4Ch+hLt88rRjrT+orUw1ilprbx8NrnIXDsncIbTG7JB0QtxL1rZTz/fhNNt2ZxJ/nmvLryP6TC+yJE0auQJkU9KSZikSVEI/dUAV8T9etnQ/o5eLE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1e2795-a4a4-4158-7252-08d72c94d954
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 15:23:30.8147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jDEbhENCNS6xL98qAQ1ORk6iVhToIVTm7WXem5Z+fW6+NVG1DenLvBvSrMDEKN5bW2HQeUiFP16IsbkLMeXsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082401_639032_9A0316FF 
X-CRM114-Status: GOOD (  19.63  )
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

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 15:35:20

> On Thu, 29 Aug 2019 13:53:24 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi Boris,
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Aug 29, 2019 at 11:41:15
> > 
> > > +Przemek
> > > 
> > > Please try to Cc active I3C contributors so they get a chance to
> > > comment on your patches.  
> > 
> > I can do that next time.
> > 
> > > 
> > > On Thu, 29 Aug 2019 12:19:32 +0200
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >   
> > > > On pre_assing_dyn_addr() the devices that fail:
> > > >   i3c_master_setdasa_locked()
> > > >   i3c_master_reattach_i3c_dev()
> > > >   i3c_master_retrieve_dev_info()
> > > > 
> > > > are kept in memory and master->bus.devs list. This makes the i3c devices
> > > > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > > > detaching and freeing the devices that fail on pre_assign_dyn_addr().  
> > > 
> > > I don't think removing those entries is a good strategy, as one might
> > > want to try to use a different dynamic address if the requested one
> > > is not available.  
> > 
> > Do you mean same 'assigned-address' attribute in DT?
> 
> Yes, or say it's another device that got the address we want and this
> device doesn't want to release the address (I'm assuming the !SA case).
> 
> > 
> > If so, it is checked here:
> > 
> > static int i3c_master_bus_init(struct i3c_master_controller *master)
> > ...
> > 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > 		struct i3c_device_info info = {
> > 			.static_addr = i3cboardinfo->static_addr,
> > 		};
> > 
> > 		if (i3cboardinfo->init_dyn_addr) {
> > 			status = i3c_bus_get_addr_slot_status(&master->bus,
> > 			^
> > 						i3cboardinfo->init_dyn_addr);
> > 			if (status != I3C_ADDR_SLOT_FREE) {
> > 				ret = -EBUSY;
> > 				goto err_detach_devs;
> > 			}
> > 		}
> > 
> > 		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > 		if (IS_ERR(i3cdev)) {
> > 			ret = PTR_ERR(i3cdev);
> > 			goto err_detach_devs;
> > 		}
> > 
> > 		i3cdev->boardinfo = i3cboardinfo;
> > 
> > 		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> > 		if (ret) {
> > 			i3c_master_free_i3c_dev(i3cdev);
> > 			goto err_detach_devs;
> > 		}
> > 	}
> > ...
> > 
> > and later if it fails i3c_master_pre_assign_dyn_addr(), the device can 
> > participate in Enter Dynamic Address Assignment process.
> > I may need to check the boardinfo->init_dyn_addr status on 
> > i3c_master_add_i3c_dev_locked before i3c_master_setnewda_locked().
> 
> I need to double check but I thought we were already handling that case
> properly.

Yes, it is handled in the code above.

> 
> > 
> > > Why not simply skipping entries that have ->dyn_addr
> > > set to 0 when preparing a DEFSLVS frame  
> > 
> > I considered that solution too but if the device isn't enumerated why 
> > should it be attached and kept in memory?
> 
> Might be a device that supports HJ, and in that case we might want the
> controller to reserve a slot in its device table for that device.
> Anyway, it doesn't hurt to have it around as long as we don't pass the
> device through DEFSLVS if it doesn't have a dynamic address. I really
> prefer to keep the logic unchanged and fix it if it needs to be fixed.

Well, we aren't reserving a slot because we need another one to attach 
the device when it is enumerated and hence a device may be using 2 slots 
in the controller.
It may cause problems in HC with reduced slots and it is another reason 
why I think we should detach device without dynamic address after the 
enumeration phase.

> 
> > Anyway we have i3c_boardinfo 
> > with DT information.
> > 
> > >   
> > > > 
> > > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > > ---
> > > >  drivers/i3c/master.c | 11 ++++++++---
> > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > index 5f4bd52..4d29e1f 100644
> > > > --- a/drivers/i3c/master.c
> > > > +++ b/drivers/i3c/master.c
> > > > @@ -1438,7 +1438,7 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> > > >  	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> > > >  					dev->boardinfo->init_dyn_addr);
> > > >  	if (ret)
> > > > -		return;
> > > > +		goto err_detach_dev;
> > > >  
> > > >  	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> > > >  	ret = i3c_master_reattach_i3c_dev(dev, 0);
> > > > @@ -1453,6 +1453,10 @@ static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> > > >  
> > > >  err_rstdaa:
> > > >  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> > > > +
> > > > +err_detach_dev:
> > > > +	i3c_master_detach_i3c_dev(dev);
> > > > +	i3c_master_free_i3c_dev(dev);  
> > > 
> > > We certainly shouldn't detach/free the i3c_dev_desc from here. If it
> > > has to be done somewhere (which I'd like to avoid), it should be done
> > > in i3c_master_bus_init() (i3c_master_pre_assign_dyn_addr() should be
> > > converted to return an int in that case).  
> > 
> > I can change it to return an error. 
> > 
> > >   
> > > >  }
> > > >  
> > > >  static void
> > > > @@ -1647,7 +1651,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > >  	enum i3c_addr_slot_status status;
> > > >  	struct i2c_dev_boardinfo *i2cboardinfo;
> > > >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > > > -	struct i3c_dev_desc *i3cdev;
> > > > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> > > >  	struct i2c_dev_desc *i2cdev;
> > > >  	int ret;
> > > >  
> > > > @@ -1746,7 +1750,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > >  	 * Pre-assign dynamic address and retrieve device information if
> > > >  	 * needed.
> > > >  	 */
> > > > -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> > > > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > > > +				 common.node)
> > > >  		i3c_master_pre_assign_dyn_addr(i3cdev);
> > > >  
> > > >  	ret = i3c_master_do_daa(master);  
> > 
> > Thank for your feedback.
> > 
> > Best regards,
> > Vitor Soares



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
