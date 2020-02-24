Return-Path: <SRS0=0Txb=4M=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDFAC11D30
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B11520726
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 11:05:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leYryd3c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Znb2jpdE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="fvfDd2R1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B11520726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQCui/qtsXWSnyDhc9Ro21ACdyAmQ6FfBU2vC1CRHjw=; b=leYryd3cNy+E9d
	JFdXebtN5nZQF9twNQAgR1hk/vC/vreU5BYLw1Nd1JgxVbwF/pR3+f8Xa0xBGnI1mcvd62c0aNvv9
	UJfD1asKj3+SzdHWjGRLju+jIt+/EARbu8UtM2ZItP52SNekEhTFASr8TuHkIMD0z2Nuud0kbwypL
	+xeZ0qdxXq3uriQs/NWZiInVcarVyLEFpT3lwI2252r0UQW5lpn8vgJb2q6J0/iaELZj8UJ8lIffW
	Fh/3VNSyEu8jbftii/Gxcagi4oGpsio7GhWp8BtWk2lE17l1ZkXZbsPG8xckvQtJ5MKXlhvMlFowV
	LBxY8fvbLS+uBGbBMWhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6BXt-0002cA-Kj; Mon, 24 Feb 2020 11:05:05 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6BXo-00025T-CH
 for linux-i3c@lists.infradead.org; Mon, 24 Feb 2020 11:05:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E70D9404BC;
 Mon, 24 Feb 2020 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582542300; bh=9n8yBjQs7fda0410uQO5unPB1STM/85FCYdsBla8vDk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Znb2jpdEmFhTJwxx2LeiVJ6mbKaxb/0TrJxQj8+Llb5QQb6KbZqPeoYs2rG0TQSgV
 unXidv0dMDJwutDyv+QWzi6rr6d1fHXcC0oNIpFwkZg619Plaouc9C+bGimH0Vyp9r
 i2Q9Q4XpND1qdfMyp1rgtRwugAdLMbRraoWBzTLNzKIU/9RvaCJskTpGMiV+dGFqOe
 VKQ7Z2MSPXQIHvW0bZ67utRZQwA7e4hJmcSxGXiZ/zGFNeyGAmJzJcUnX2hhZSCdVK
 lVlNUcQwcgP2pmZMYYYyqWzrrDMFqreYk+dy2YktPMmmh8jwUmyDzDTg6mlyZtTx2V
 di8YhRjYUtg7Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8EEDAA008E;
 Mon, 24 Feb 2020 11:04:52 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 24 Feb 2020 03:04:52 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 24 Feb 2020 03:04:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3UKFkAXaX3vegsQCqjZvnLdiy+uitYekyZyZokAyg9ZLQm1ZM33zq9EdfuicyYUQbvhaUhFcrAMvKX8ZWwGCN/ycyySxuXENb+GBY9y7Gq6QWML1gaPCWOGfeTURc7sW300MmoOZCoMKiY9SQ6MDIsJ4QRxulZgtQwiulYfVDBnNBElpgX6+2ckMgpyrJVITj4OvoDm+PzGd+9vb9G+zojvHnE+5zB4r7JVqAQGlDJPuI5/kXzqFcVU/YG4t9z/NuDkAnHeCfQTbTy3/p368bWSNRWIGkUZCancoyOy+9pW6+yaX8oQrYwjlhRir5NW7wDYvW20OT5DdJw4e/raWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPucjGnWiJQDW9V8ogQ0usGweUz2nc+KY/rmAekiyeE=;
 b=dTnOV76tvG9IxOzFHpb0cGsR5R+LBFsa9oUwxhJzCDc5rXxGlxSwjskm8p09bLOT4LOt9uCR8XiTzweJ37p+gy/qB0YaQcY3adcu4BTZucIqNTpWD5HVTekPB90KEL1sUoMsR7qvH7aw63aBLI9Q1wGSRvnItfrfMEU/6KkcgjWvzT9ANtcztDL/JxqlPEYLP+R8OI705RsdM29jXJxvNncVXkNBtGQf1bwjmxjJW6UmboIfGu27a0KYUqBt1JYvQj+nN/6JP3CS8uSZgvpYm5a/v8DR99TIMwMIZfV1i0JaZQSVIQDZofZF393EoD/qhXQ10U661f79h+4XWpXswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPucjGnWiJQDW9V8ogQ0usGweUz2nc+KY/rmAekiyeE=;
 b=fvfDd2R15zu369H8ugIwMBKmSs7N1BpoQnMGvGzr1L1JKzFDv0/vguK3ZPiBNB2ViQQTVCn7SQ25dZMjlU09UeDUauJz+CqaHiefDjimgHjRLbWigJDU9B48WNx7D4QcFrkXzSL5+nP5bmtnii0papylVzp17/01v9SrJfvh5zQ=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 by CH2PR12MB3800.namprd12.prod.outlook.com (2603:10b6:610:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Mon, 24 Feb
 2020 11:04:50 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe%5]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 11:04:50 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Topic: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Index: AQHV5rqGCzs/XZoBrU+kjYi0pz6mk6gmQBQAgAPz2YA=
Date: Mon, 24 Feb 2020 11:04:50 +0000
Message-ID: <CH2PR12MB42163351853CCC029D28164BAEEC0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
 <20200221233216.3b2038f8@collabora.com>
In-Reply-To: <20200221233216.3b2038f8@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNzgwM2I3ODYtNTZmNS0xMWVhLTgyOTEtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDc4MDNiNzg3LTU2ZjUtMTFlYS04MjkxLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTgyMyIgdD0iMTMyMjcwMTU4ODg3OTA5?=
 =?us-ascii?Q?NTQzIiBoPSJqYXI4YXpMUGFsc1lydGNlUGxNK01GTnRTTEk9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUNu?=
 =?us-ascii?Q?K09VNkF1dlZBVHBrTVI0ZmZwZ1hPbVF4SGg5K21CY09BQUFBQUFBQUFBQUFB?=
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
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4229864-7cc3-4c07-12b7-08d7b9195e50
x-ms-traffictypediagnostic: CH2PR12MB3800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38007AF7F22629D7E78272F0AEEC0@CH2PR12MB3800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(55016002)(9686003)(76116006)(66476007)(66946007)(66446008)(64756008)(66556008)(81156014)(8676002)(71200400001)(4326008)(33656002)(81166006)(7696005)(6916009)(26005)(478600001)(5660300002)(86362001)(186003)(52536014)(54906003)(2906002)(316002)(6506007)(8936002)(42413003)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3800;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bp02Q2/yctgCvtR1eilLbZOiGGefJ9SYTAtzJqpsmkekG9EVATHnvpC82K9B0nW79LTYlUtZ8XCNcBhislHK6u6QRuCt96jV7K5+t/axfUc6aNcsTNEmfqLFB2MBUF+aUvEPfHNjt6sJLiubOmt1R338DNbirB8auZNxnseKHOENM9tkSXl+++KEOzUg1FsIxe6QSbJZOo3gism7/xmLDd5RzLyNDW30YVSEhP+qvpT34F2CmFAPbS1korrXEkVuSuoj/Hv278lZqEYgGylRBU4oBN6tGVV6YxhSSw8HfeSOLevOhr9PtK5/VJgUMdoM6XrMMFWmgaTnhst8L4R7LC5o6BNBZRru2syavA/pKrYdRG4sF86vqUVOuRN25H0X3ihku3SHXfr0DEkltwiIEDOxMqXsHJSIO2TGOAQ4yww0/lvR/oK/qGqpYaebeJ3ORnmfcMCLVEBRCmc16KYGcu0vXrODxX16+mBA4wvgZQZkJcvhGyYlEcacSF2SmEqBRvRLL3ZO/Y2lnue9KhiDWhGmL3/l6zCByz9n5SdVRj4jY4GfATaOtP14ZT+RDgf/HTAcE+bUv0dg1jGmjYr+jYTw2ufCZqVpq+xdDeHM7Jc=
x-ms-exchange-antispam-messagedata: JyeIawWNwQXIDpJBdIm1IfhQnhsqi61Kub/8tWNexswFptR/13pmtODSpNqTZnDzCuzd+IAdjix1zsZe0XedHyB6pK+OXm5ycwoJMAfE6eWsH39p7I0+J1JvOQdYrpXFsN7n0EgNuCzjfTlcpH489A==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d4229864-7cc3-4c07-12b7-08d7b9195e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 11:04:50.3383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMTICkK7zfoowClTGNCYVjSe8dgnbygrIKSmZRdoQqcvDBjDysv/0cCKqarD7Y8UM/3u0Dyd+3+QfAz3IGcUZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3800
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_030500_429503_E752D9D2 
X-CRM114-Status: GOOD (  13.06  )
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
 "arnd@arndb.de" <arnd@arndb.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, Feb 21, 2020 at 22:32:16

> On Wed, 19 Feb 2020 01:20:42 +0100
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > +static int i3cdev_detach(struct device *dev, void *dummy)
> > +{
> > +	struct i3cdev_data *i3cdev;
> > +	struct i3c_device *i3c;
> > +
> > +	if (dev->type == &i3c_masterdev_type)
> > +		return 0;
> > +
> > +	i3c = dev_to_i3cdev(dev);
> > +
> > +	i3cdev = i3cdev_get_drvdata(i3c);
> > +	if (!i3cdev)
> > +		return 0;
> > +
> > +	/* Prevent transfers while cdev removal */
> > +	mutex_lock(&i3cdev->xfer_lock);
> > +	cdev_del(&i3cdev->cdev);
> 
> When cdev_del() returns there might be opened FDs pointing to your
> i3cdev [1] ...

Yes, I know. I protected the driver part but I missed the 
file->private_data.

> 
> > +	device_destroy(i3cdev_class, MKDEV(MAJOR(i3cdev_number), i3cdev->id));
> > +	mutex_unlock(&i3cdev->xfer_lock);
> > +
> > +	ida_simple_remove(&i3cdev_ida, i3cdev->id);
> > +	put_i3cdev(i3cdev);
> 
> ... and you call put_i3cdev() here which frees the i3cdev object,
> leading to potential use-after-free if any of the fops (ioctl, read,
> write) are called on those dangling FDs. That's exactly the kind of
> nightmare I'd like to avoid.
> 
> > +
> > +	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));
> > +
> > +	return 0;
> > +}
> > +
> 
> [1]https://urldefense.proofpoint.com/v2/url?u=https-3A__elixir.bootlin.com_linux_latest_source_fs_char-5Fdev.c-23L587&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=qVuU64u9x77Y0Kd0PhDK_lpxFgg6PK9PateHwjb_DY0&m=tn0F5CeiGtvih3B93GkstU1b2CzoxKklNq4vIvshH8I&s=FwSMjJ-YZFPUB6WCQM0KnFqFSVKp5KdKHdqSiu_0ycU&e= 



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
