Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEFDC3404C
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA6824654
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1XcnJid";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y48s2yLa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="c8nErRCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA6824654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KY3DJKQKg0F+HuXhpkZLvhvYwI4vE8QgyeFZoqnhXU=; b=P1XcnJidd27Ri8
	YIgscGeE2G7SgOMP2eIXJK+vknfNOxJEdK3NIWJYkhZ86oORh2Kj4uiTk6QWtM8oTWGgt1+ve4FIN
	oYhOezGse0Sq1NYv2+e5fSqmV1p0KTosjNz4aZE6ivixoK7DLi9StwkDivqUWkq3DUo6vrnhlR2R0
	+vJW0xVjcx77umweIDDUAModlAi8mmdjMVxg7yUu4m/Q1Oc1jetWU73lD+PFbEQcuSJGTyoQVv4DS
	3HXbsA25fgzlB3RepHJhFCcVPukuXTqNl8qbFadikCPjnFdmYI9eOlJSz/YSF3mo4szdDEfpkAh1u
	5lu0JTwaeEBXcEsLkBaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4DVl-0007nb-22; Wed, 19 Feb 2020 00:46:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4DVg-0007nE-W1
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 00:46:42 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 661A7C0098;
 Wed, 19 Feb 2020 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582073200; bh=rH/CpIXH5+eeVDaT0CFsl/+Hn/2PaTB8cVz/wc1VCJA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Y48s2yLahJn7droDo/Kyns+XCu4m2Ye+84njzVHG8d55ZpYlp3JOwnMSUIptUXu8J
 IfeRCPr9q25r98CuMihBcitcd+c3+LD9lv1Mwr2UhlTTWvU0rPkal7AeTvBGf8wYLW
 RJkNJjT/Ew7IhO7tQSfwnX7sMhh+Gm2LzRN5PIDIWnKgpl28rjgwUnvzzCPgDAFKxl
 kg0aaCA4lR3Mq34v0+4s7U0oqYL0rKVs+MNqtPaQQxvOZjrPKuc5EajMkR4fW1UoUh
 qJJkdCqq/O42O4jVyonSDi/kjsuOoqjfItHrEcUoIB+3H2z+cPpTjkUJKcJ+Yj1FLc
 Ab6NeWi84KhLg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C644A00B6;
 Wed, 19 Feb 2020 00:46:40 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 18 Feb 2020 16:46:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 18 Feb 2020 16:46:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjEVmG9VNC3C8WQR2rWzmgXc9BKVdvgcWRbnZYHH6cc9c5M4eQr0mN+HnxRN30S3iOQKVmHV3Qinhh2SZIigT/RFbdyLzkVZGv0obJzsIBxfItz2NAfwOknpYm8ImLg2Mv6miNPwVoMosnv6xIdRSqSoVEx2tSo/RDF5cXN5lDKrWDrXPpxlMmycSc/t+CXswi67H/S2d9/3sarfuDCuoOTlo3dygZifPlfVJLkRy3o1boyfsIyt7jWL09O/kGmvAoPEbnXMt3ytuRZM9F8wXg6gs/YGubYqs9HRfFCWyih80LXAtYejlt8gAXkDjTyu2cSsR/3onS2iswZmRbhnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4l7I7ZaFDDX+9YiWeWYrQcB4vcIoi6R7SkkvOehTeQ=;
 b=Kufi14o2INhbaIK40A3lzFcipSR6fjaSFCf9UvzuLzbRWRWSl1sXUdxB9YiwBGsmyaXWdTjHvVPKhmUu+vMBYop2SJJ7klz+Gvh3hXX+NiWqurHDQh7r6kWmP20zDDsiirkEtVoJ0/UKw76Tejbtun5myXEKnSbSI2bR1AzWw5Fc0I4X6azD7HTZ0rdOwccSrYW8HhQvDWjHvRIxjsOeljR9eivs+2ntwoVOs/KFHeB51rSOrAZOFDcjxpYAA8nX8bsPprs+RGCYdWPs8MOVckuHibsyDt6HJ/V0nzGLZHRIb3HlJ0XHIaHFOfwYyHhlbczHIpKKgqJRmn3iQ4UcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4l7I7ZaFDDX+9YiWeWYrQcB4vcIoi6R7SkkvOehTeQ=;
 b=c8nErRCY8JjpNH+v9Rpj+5rZmq6ywgSmC4QG5s04oRVSM5kTqmT+fd5MmUVQPtEkik0uHymBqkL3JQWXUyT7FaM0efTPPRA7oY0XEOcChIdScWMaV0R0Zhq3F4ePVcfVdFLaIcMz2z9nOvmU1ymjNeM5/eVCXJZDVdaYeKOSiIo=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4295.namprd12.prod.outlook.com (20.180.6.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 19 Feb 2020 00:46:37 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe%5]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 00:46:37 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v3 5/5] add i3cdev documentation
Thread-Topic: [PATCH v3 5/5] add i3cdev documentation
Thread-Index: AQHV5rqGOSLM4YN16UyYKJplE7dG56ghrNgQ
Date: Wed, 19 Feb 2020 00:46:37 +0000
Message-ID: <CH2PR12MB4216C24416E37DE80F0A5A8CAE100@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <a6f65d23947070f52c43fee4a1427745ea675ae0.1582069402.git.vitor.soares@synopsys.com>
In-Reply-To: <a6f65d23947070f52c43fee4a1427745ea675ae0.1582069402.git.vitor.soares@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNDY4MmI4YWItNTJiMS0xMWVhLTgyOGQtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDQ2ODJiOGFjLTUyYjEtMTFlYS04MjhkLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iNTUyNyIgdD0iMTMyMjY1NDY3OTU2Nzg2?=
 =?us-ascii?Q?NTMzIiBoPSJQUGc5S0FkV1dmaE9hcUhraGdDaTI3eDJadjA9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJs?=
 =?us-ascii?Q?ZFowSnZ1YlZBZktBU1R4YmpmbjY4b0JKUEZ1Titmb09BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQXNQcFJHUUFBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
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
x-originating-ip: [2.83.222.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 466dd169-1731-4d74-d846-08d7b4d52d5a
x-ms-traffictypediagnostic: CH2PR12MB4295:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4295FDE04FF4B5953AABBEE4AE100@CH2PR12MB4295.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(66946007)(66556008)(64756008)(52536014)(6916009)(81156014)(4326008)(8936002)(6506007)(8676002)(66476007)(66446008)(2906002)(86362001)(76116006)(33656002)(81166006)(26005)(186003)(55016002)(478600001)(316002)(7696005)(5660300002)(71200400001)(54906003)(9686003)(42413003)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4295;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbklM1csYZuo7x0SYXK9ftc2xfU9zslIu3yhLRUg9lOfK96/lU7tiAOtI4jWcHmfM8FjfwitR++v+BRsIyWdbyIj0aqZ2uH1PGyAHtWp5RHqHjtXT3El2YdoijDWAWiLLGFysW6XNcvSWGr2SGKq/SHEQemINpuydfLws9ggMRrIVe3mI4PaSwEO/dtYamhTY+mN3Bu7bJkS5agOhGQXhv/BMgjfCF3khB46Q/Ta8lzg9UWJKcZUoMWTWkuJXat5AH0rhzc32v7l84yr5g+NJ9v3LNV4+/ow61aTGx2acOPz8JOliQtnywI4b/pQyvYjRg8buVP33In58URlXW36HZzhMhlB4B0H5xv0Li2quYgA9ryyAZhQW8UISv2YQy7YuelJFmQ3VvDMpK3ZWFSNZPEIWWXDVLGEmLHAxVBeH3KArew2yZ22p+HKMFWcVkIkvIMfRLlfYB0myFYkBRQ3US5VB1g6pFea8x+7ellHLxO9dTnVHjHuHgKpxCKFxNqNcJrurJ1OfvKGnuttncs3Mg==
x-ms-exchange-antispam-messagedata: tWQnEYodyC8dgQU5QY9/senaUhVeHKVqMgCS8ZYxc0r37CGgXnan0Urc151BTLDl8qG/oHFt74ABjt6+x+cuLo1W1DjAK+03ZnTW3eNVOQVYaF8J6ji9TtvExN9xG8NDIo5QZRt/zptZYEehYI/fsA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 466dd169-1731-4d74-d846-08d7b4d52d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 00:46:37.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZyU3Ph0VGLKtVS49TD+m2wzw+WPSbj0s/sX/ZhwJ7c/G1QEwGM/b+SOtw3NjK6JOUTZtX4buGWe+eQQJqSrpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_164641_102825_05BCEBA3 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Jonathan,


From: Vitor Soares <vitor.soares@synopsys.com>
Date: Wed, Feb 19, 2020 at 00:20:43

> This patch add documentation for the userspace API of i3cdev module.
> 

I just realize now that I missed the commit message, it should be:
  userspace-api: i3c: add i3cdev documentation

I will do next time.

> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/userspace-api/i3c/i3cdev.rst | 116 +++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/userspace-api/i3c/i3cdev.rst
> 
> diff --git a/Documentation/userspace-api/i3c/i3cdev.rst b/Documentation/userspace-api/i3c/i3cdev.rst
> new file mode 100644
> index 0000000..ada269f
> --- /dev/null
> +++ b/Documentation/userspace-api/i3c/i3cdev.rst
> @@ -0,0 +1,116 @@
> +====================
> +I3C Device Interface
> +====================
> +
> +I3C devices have the flexibility of being accessed from userspace, as well
> +through the conventional use of kernel drivers. Userspace access, although
> +limited to private SDR I3C transfers, provides the advantage of simplifying
> +the implementation of straightforward communication protocols, applicable to
> +scenarios where transfers are dedicated such for sensor bring-up scenarios
> +(prototyping environments) or for microcontroller slave communication
> +implementation.
> +
> +The major device number is dynamically attributed and it's all reserved for
> +the i3c devices. By default, the i3cdev module only exposes the i3c devices
> +without device driver bind and aren't of master type in sort of character
> +device file under /dev/bus/i3c/ folder. They are identified through its
> +<bus id>-<Provisional ID> same way they can be found in /sys/bus/i3c/devices/.
> +::
> +
> +# ls -l /dev/bus/i3c/
> +total 0
> +crw-------    1 root     root      248,   0 Jan  1 00:22 0-6072303904d2
> +crw-------    1 root     root      248,   1 Jan  1 00:22 0-b7405ba00929
> +
> +The simplest way to use this interface is to not have an I3C device bound to
> +a kernel driver, this can be achieved by not have the kernel driver loaded or
> +using the Sysfs to unbind the kernel driver from the device.
> +
> +BASIC CHARACTER DEVICE API
> +===============================
> +For now, the API has only support private SDR read and write transfers.
> +Those transaction can be achieved by the following:
> +
> +``read(file, buffer, sizeof(buffer))``
> +  The standard read() operation will work as a simple transaction of private
> +  SDR read data followed a stop.
> +  Return the number of bytes read on success, and a negative error otherwise.
> +
> +``write(file, buffer, sizeof(buffer))``
> +  The standard write() operation will work as a simple transaction of private
> +  SDR write data followed a stop.
> +  Return the number of bytes written on success, and a negative error otherwise.
> +
> +``ioctl(file, I3C_IOC_PRIV_XFER(nxfers), struct i3c_ioc_priv_xfer *xfers)``
> +  It combines read/write transactions without a stop in between.
> +  Return 0 on success, and a negative error otherwise.
> +
> +NOTES:
> +  - According to the MIPI I3C Protocol is the I3C slave that terminates the read
> +    transaction otherwise Master can abort early on ninth (T) data bit of each
> +    SDR data word.
> +
> +  - Normal open() and close() operations on /dev/bus/i3c/<bus>-<provisional id>
> +    files work as you would expect.
> +
> +  - As documented in cdev_del() if a device was already open during
> +    i3cdev_detach, the read(), write() and ioctl() fops will still be callable
> +    yet they will return -EACCES.
> +
> +C EXAMPLE
> +=========
> +Working with I3C devices is much like working with files. You will need to open
> +a file descriptor, do some I/O operations with it, and then close it.
> +
> +The following header files should be included in an I3C program::
> +
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <linux/types.h>
> +#include <linux/i3c/i3cdev.h>
> +
> +To work with an I3C device, the application must open the driver, made
> +available at the device node::
> +
> +  int file;
> +
> +  file = open("/dev/bus/i3c/0-6072303904d2", O_RDWR);
> +  if (file < 0)
> +  exit(1);
> +
> +Now the file is opened, we can perform the operations available::
> +
> +  /* Write function */
> +  uint_t8  buf[] = {0x00, 0xde, 0xad, 0xbe, 0xef}
> +  if (write(file, buf, 5) != 5) {
> +    /* ERROR HANDLING: I3C transaction failed */
> +  }
> +
> +  /*  Read function */
> +  ret = read(file, buf, 5);
> +  If (ret < 0) {
> +    /* ERROR HANDLING: I3C transaction failed */
> +  } else {
> +    /* Iterate over buf[] to get the read data */
> +  }
> +
> +  /* IOCTL function */
> +  struct i3c_ioc_priv_xfer xfers[2];
> +
> +  uint8_t tx_buf[] = {0x00, 0xde, 0xad, 0xbe, 0xef};
> +  uint8_t rx_buf[10];
> +
> +  xfers[0].data = (uintptr_t)tx_buf;
> +  xfers[0].len = 5;
> +  xfers[0].rnw = 0;
> +  xfers[1].data = (uintptr_t)rx_buf;
> +  xfers[1].len = 10;
> +  xfers[1].rnw = 1;
> +
> +  if (ioctl(file, I3C_IOC_PRIV_XFER(2), xfers) < 0)
> +    /* ERROR HANDLING: I3C transaction failed */
> +
> +The device can be closed when the open file descriptor is no longer required::
> +
> +  close(file);
> \ No newline at end of file
> -- 
> 2.7.4

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
