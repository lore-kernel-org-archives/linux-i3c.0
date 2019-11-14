Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E1BC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 11:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8FB206D8
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 11:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8ijLNGr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SoymIaDQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="VBt6n7u7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8FB206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Do3dvs7+l/oQz+gDx2ceAX/lsZ9u41SnQtaqzLGN8o=; b=D8ijLNGrpAUcpT
	7uIVkKys6plVOrKBYapK96JEP1GO1N3UEKRwMH6HfwQJ8pR0BiZQwSjVnqI8PDzx2mwsr6eFgUMXF
	RLZ1fwW6elzE3LSGxliSWt4VKAMvI9QmWAfl/R0aDYzdvmyoHoCLysbtEE+qz30Ee721GruBRCzTL
	v+d68Iq0UaTvyS4QHg7n7EnBj/Ia2jXZLrWv7pZ2H3mnuAg6An+x91fFMaXQc0gJM3RGUdVeYvzjU
	qG4Nl+nGy20HbG6F7KAwzcGapWYb8hQET0ybl5iUH+Ay2rFmsixua+g2pBeY5Pk6cTfa+CVqvltHN
	jU3AfCH513R2byIyNmEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVDlr-0003aS-1s; Thu, 14 Nov 2019 11:58:43 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVDlo-0003a6-8F
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 11:58:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20900C0C3F;
 Thu, 14 Nov 2019 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573732720; bh=njEUaGplRhJOG97td2mYy/02KsmFbbC99siPF/SUQ2E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SoymIaDQLEnJn2djwZ00R3+/2pmD5QVrJJ5nMTmH112Am2W7Xn3ntSC4hcFb3jZxJ
 5WkOsi6tKMNVJsHYusZVzoixU5LAhZNd0fDlfjC3peWSVDrv8Qvbdg5HZyWy8lJItB
 tCBm15yTRoIx4wTdi1R3s8bdw0OWOJykWCQAccyl1fuBFZpI0u4LgSGEwM1u3nes/f
 uuIpy8gQxIVkHDSCw3wOkyLSFP8rC+mt3Hyu/IkP5iIhT8jiN6yeja8NNCz6smJ3O3
 YonyR/1QrhXDT2bX7vP4pBe7HvdzO3orluOs0Bb/+zh7YZW1ReLQlRmPK4c8TEwb7i
 Ut4UrOcSIW0oQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0E1E4A00AC;
 Thu, 14 Nov 2019 11:58:40 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 Nov 2019 03:58:32 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 14 Nov 2019 03:58:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLUnbLGda2DQmW/CmzvTvIp/BdyV4QPR+//KTj0ROHkG/362uvoj45skgJw0CdWDb2l3VyI0PNSIOOFKCjJoZEE63b2/ZYAKThuCA+3Dr9MlSO2E05LN/szPUeJTMqGnAnKUeNPwjSzyUkZHIvAEMbiHZL5Gi1yzVASj/JingRH8DkS9b8UDV61ItB7dkSnW5FFsF49/QG7pqzB8W31BE9YOuVVbkQFL8eRsGn5hOWwP1XDo7nihteWKk+JWz+nRb3H6FguGaSbqUFhiRkD41goz0mkH0WpidT6BY2D0rrUfybfskWCu+GSEp0DqGx5BORwhhUg3T5OtVL/wHjoRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo7p5F1WNoNgCztKHzc5LuULb/z70Et7dVZWrnyDRs4=;
 b=N+DYCGwLqlk0z9LI/M//3/71gDl0+e+DATuuVswXcr82TYYr5GQugiiayEqt9Fy3FZw/GJA/O4Iux8kFqCRageGNNlAZwZ+oPlVw36lKWd+Xp3DHYoTeJ8863dIa7fIce5FZT9Y3W7VXYiMaMeRbxPM1YTIYJHn+L1ZuU9weLsrJX8xJ6EnviJ4q0LTM8V5p1IN16mdc5JaWWHRfz9lyV/EM48xMjmoqltZYwttNarvhMoEnbN4R7hhIJiZSQimXPUZpS4tFBV//FcSgaZdGx1ommLxs/w7Hi1DYZ5e+7qjfp4usJo7CYVBqP76xzZjL/yjwNsaqZ77MjG14DlTVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo7p5F1WNoNgCztKHzc5LuULb/z70Et7dVZWrnyDRs4=;
 b=VBt6n7u7fKhh6eLEo1204oRgJ4ablOAtIlKd7ijJLUCTkkUBFjuvAPNJ1jbwexdLpyaS/Lo49/Y7ETPT0IuqYRHUhlQPEGJYyhhpmuX7rt/G1QWZdEppykjvD4m7QJfp/3JZGbs0otnVNkA1nQgQqb0Sd4y58N/AakXgr+MvHFw=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3766.namprd12.prod.outlook.com (52.132.247.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Thu, 14 Nov 2019 11:58:30 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 11:58:30 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>
Subject: RE: [PATCH 0/3] Add data hold delay support
Thread-Topic: [PATCH 0/3] Add data hold delay support
Thread-Index: AQHVmq/LglrgLyocSke+UXcOLF8KFaeKj84Q
Date: Thu, 14 Nov 2019 11:58:30 +0000
Message-ID: <CH2PR12MB4216AF4224EDEE99E6C4B74FAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
In-Reply-To: <20191114055155.20446-1-pgaj@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMTA5ZGZiZWYtMDZkNi0xMWVhLTgyNjUtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDEwOWRmYmYxLTA2ZDYtMTFlYS04MjY1LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTA4MCIgdD0iMTMyMTgyMDYzMDY5OTM2?=
 =?us-ascii?Q?NjIyIiBoPSI3bFZKU051dUtpZ0Q5WFZwT01iL0tKY1FaYTg9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUR1?=
 =?us-ascii?Q?Ty9iUzRwclZBWUUvY3pDaHhpQTJnVDl6TUtIR0lEWU9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 1166cbc1-547c-463a-f45c-08d768f9f76d
x-ms-traffictypediagnostic: CH2PR12MB3766:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB37664F9E84F914C05BF4BA48AE710@CH2PR12MB3766.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(366004)(39860400002)(396003)(189003)(199004)(7696005)(6506007)(102836004)(76176011)(26005)(486006)(11346002)(476003)(446003)(99286004)(186003)(33656002)(256004)(7736002)(76116006)(305945005)(8676002)(74316002)(8936002)(81156014)(14444005)(66066001)(81166006)(3846002)(6116002)(14454004)(6246003)(9686003)(4326008)(6436002)(2501003)(478600001)(2906002)(25786009)(110136005)(5660300002)(4744005)(66476007)(71190400001)(71200400001)(54906003)(66556008)(64756008)(66446008)(316002)(66946007)(55016002)(86362001)(229853002)(52536014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3766;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Idf9za4ox8nMZpf172g2fZHm1f5b30qmBfmob4cm1Q9sJ14o4iMlGzkBv9MtAnXcRNKDiLaBVklkGN02uau7wVheVim15KnbD0Olz6BTCUaSE/UeLrKmQ4O6lR+FwbdBpPJOZoranNOE5/dVjgpPLj1cn0fxYhT3+Ot0ohTrZk1CsuJh8kOB1sCOKO/1qsC/ZzKd1c8gHQiXldJpn9LtHtlshEBapbOjac5hSRucQEvv0ofQyieS2oqcHtR//DLJT4gSV8TTV6YmfXL2c55WAxtgbTdHjQIOL74yAT0zu55pyvRi2ihk6o74G/kr0KxLEtHh2MA8xyYC84XDAKPZ493P3z1SS76xSSkL2eJFU0vekqNjz+7vS7H37ZrewgFzpzALfmSwZAzHWVRsd+0nEVlQ5rm+BPgjtttRCX0dFsY0dR7H258yek7HtyZQLTO
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1166cbc1-547c-463a-f45c-08d768f9f76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 11:58:30.1865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmvwodbYUkqZmm0GaTybdF8LeojgXVK+RE+eSpKvFGOrH3cgjw8iVcyxy4IZ7nXtYrYELJqKaavtDJdsBdrgiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3766
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_035840_307259_767327B4 
X-CRM114-Status: GOOD (  10.69  )
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

Hi,

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Thu, Nov 14, 2019 at 05:51:52

> Add THD_DEL (Data Hold Delay) support. After testing different scenarios,
> on various systems, sometimes there is a need to delay SDA_OUT propagation.
> 
> Adding support which allows to configure that delay using the device
> tree parameter.
> 
> Przemyslaw Gaj (3):
>   i3c: master: add data hold delay support
>   dt-bindings: i3c: Document data hold delay feature
>   MAINTAINERS: add myself as maintainer of Cadence I3C master controller
>     driver
> 
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
>  MAINTAINERS                                               | 6 ++++++
>  drivers/i3c/master/i3c-master-cdns.c                      | 5 ++++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> -- 
> 2.14.0

I'm trying to understand this implementation and the use case but I'm not 
understanding.

Could you please elaborate?

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
