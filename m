Return-Path: <SRS0=HC+M=SR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673C2C10F0E
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 12:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F9F9206BA
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 12:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Np65rJQg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j/9lC12Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F9F9206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=655ocxiD7/IRmbzDirsFEkhEw2P9I0TQnQjgVRVecY8=; b=Np65rJQgw+XXY8
	4fGSnB2QlMNruRwoWPNDZs8mjtpXC2w8zgu5BhdEOa6xSwuHHy7++N63ODChywPgzCMbCajVeNvmZ
	JYTtFLCV+1AWW7EtnRoAWilj6SlxUfqdvfEtRp9qK1/w4nHLRB24yvf6gcwt0oX5uPdlDX11IZ6Uc
	yvwINdWNuWp0GHLx25SB3Z9ZjJ2QmaKmDPPnpCAxpNZ8EPxATRh3eRGpFr+HXJG1GdNKdp7IhsQnA
	P2EAAPeCNN8juc1+m3wx9llGx1Ip+uwCACXfLyOwx+H1T3/mgS/l06mlxzwFFvCVfeEtLVwjNxSeg
	8m/65oxe5Hz+wKjvA9MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG0JR-0003fO-SA; Mon, 15 Apr 2019 12:02:13 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG0JO-0003ZU-Vv
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 12:02:12 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id C664324E1F10;
 Mon, 15 Apr 2019 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555329727; bh=0Z+foSEzAnOshqkCP19t+hyGme6Hxoo8+c1XqBPPXFI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=j/9lC12YV48SriRp4P1YXcPFiV5v8chb3YAIGfmAQn2RQQharLCTgu1b81x+UQXsp
 aRPkACdvgf3Kpvxe7gI4kNqotsf7ych7RsGkuO2REBRNb4SfzBBd9YPmraSdecTO5s
 5Dy1Yeg2XZgjhcNoEL1of27qmelsopZ9K3OJlPVNg8Bt7jXLHzUevJEzklBk8XES/L
 dYuaS7IDif4lK+Fiye95zISOdb1jDJ7TJ2t6QpLJacFn1rAXcFY7XG0bpwh1cvQUm2
 eY23Z6dKRmCORrKXoZCq3ngftvO3isfokIZ6u/E59+qVQjLUqaRqkJJCi/wKHDy8EW
 4SVYj/xmcqP4g==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 41889A00A7;
 Mon, 15 Apr 2019 12:02:04 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 15 Apr 2019 05:02:04 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 15 Apr 2019 14:02:02 +0200
From: Vitor Soares <vitor.soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Subject: RE: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHU10l/l7Y/AuF2m06V4TWxPbYeTaYnpPuAgAw6WdCAACAaAIAAIjYggADigwCAAE2IsP//8JuAgANPWhCAAB5OgIAAN0Rg
Date: Mon, 15 Apr 2019 12:02:02 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A614688@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
 <20190410065339.GB8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
 <20190410123603.0ef10c19@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A614581@DE02WEMBXB.internal.synopsys.com>
 <20190412165719.0cd91421@collabora.com>
In-Reply-To: <20190412165719.0cd91421@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNDUwYmViZjItNWY3Ni0xMWU5LTgyM2EtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XDQ1MGJlYmYzLTVmNzYtMTFlOS04MjNhLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iNTk4NCIgdD0iMTMxOTk4MDMzMjA4MTUx?=
 =?us-ascii?Q?MzYwIiBoPSJzUWlCcnVLamhLaU9YUnZNaUtONkN4SlJFSW89IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJB?=
 =?us-ascii?Q?RFd3SWcvUFVBVklIZ2RMSTdyai9VZ2VCMHNqdXVQOE9BQUFBQUFBQUFBQUFB?=
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
x-originating-ip: [10.107.25.87]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_050211_041118_A078E540 
X-CRM114-Status: GOOD (  38.04  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "agolec@cadence.com" <agolec@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, Apr 12, 
2019 at 15:57:19

> On Fri, 12 Apr 2019 14:28:26 +0000
> Vitor Soares <vitor.soares@synopsys.com> wrote:
> 
> > > > What if the slave is a secondary master? In your opinion what should be 
> > > > the flow?  
> > > 
> > > i3c_slave_regiter(&ctrl->slave);
> > > i3c_master_regiter(&ctrl->master);
> > > 
> > > The order is arbitrary, and those might actually be called from
> > > different path if it makes more sense. I'm just pointing out that
> > > registering a slave and registering a master are 2 different things,
> > > and the master side of the framework should probably not automate slave
> > > registration, at least not until we have a better idea of what the
> > > slave API will look like.  
> > 
> > We need to understand better your point.
> > 
> > The secondary master can have both roles and even not implementing all 
> > slave function it is a slave when is not a master.
> > For me still keep the idea:
> > 
> >         bus
> >          / \
> >        /     \
> > slave    master
> > 
> > and just one role is active at time.
> > 
> > I didn't get why the bus shouldn't be instantiated for slave. Can you 
> > explain?
> 
> Because, from a SW PoV, pure slave devices don't care about the bus
> concept. Do you have use cases where you'd need to know what bus the
> slave is connected to?
> 

In device model I expect that the slave is under a bus. You may not need 
to know the bus topologies and the devices connect but at least we might 
need to know the bus is alive.

The I2C subsystem implement that and it is working.

I still don't understand your position, is there any other reasons?

> AFAICT, all you can do is reply to master requests (probably with some
> predefined messages, like values stored in a regmap or data queued in
> a FIFO).

We can list it:
  - RX/TX SDR data
  - RX/TX HDR data
  - SIR
  - HJ
  - MR (case of sec master)
  - CCC 
  - and perhaps timing control.

> 
> > 
> > In any case we will need a common point to switch the roles.
> 
> We'd need a way to relinquish bus ownership, that's all. When the
> master is not the current master, it automatically becomes a slave, and
> if it has any "I3C slave" profile registered, it can reply to requests
> coming from the current master.

This is too abstract to me. Can you point a current example? Because for 
me we need a common layer for both master slave structures.

> 
> > > > > > > > In this way you are able to add DEFSLVS even before the HC has enable MR     
> > > > > > > events like it is done    
> > > > > > > > with dt devices.    
> > > > > > > 
> > > > > > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > > > > > from
> > > > > > > current master right after ENTDAA. Could you please explain?    
> > > > > > 
> > > > > > So the current master receive an hot join and send the DEFSLVS, when do you
> > > > > > add them to the bus? Will you go for the all process to get all dev info and so on?
> > > > > >     
> > > > > 
> > > > > When current master receives an hot-join, do ENTDAA to enumerate device which
> > > > > joined the bus and then sends DEFSLVS. This data is stored in secondary master
> > > > > controller and if secondary master can request mastership, collects all
> > > > > required informations and adds the devices. It has to collect PID, DEFSLVS does
> > > > > not provide this information.    
> > > > 
> > > > I see now. You need to take care here because when the secondary master 
> > > > add the i3c_dev it might change the address.
> > > > This is one of the reasons I would prefer a dedicated function to add the 
> > > > DEFSLVS.  
> > > 
> > > IIRC, Cadence IP is parsing DEFSLVS in HW, and the device table is
> > > automatically filled based on that. We should only add the DEFSLVS
> > > parsing helper once we start seeing a need for it (probably when adding
> > > secondary slave support since you seem to insist on this aspect :-)).  
> > 
> > For me the subsystem should hold and handle all this information. Anyway, 
> > this information is received and needed before the mastership takeover.
> 
> It is, and we already have a bunch of helpers to add new devices. Maybe
> we need a few more, I'm just saying that forging a DEFSLVS frame to then
> pass it to the core is not the right solution IMO. 
> If you need an helper
> that automatically parses a DEFSLVS frame and add the new devices, then
> fine, add this helper to the framework and use it in your driver, but
> don't force other drivers to use this method.

This is not based in a need. I can also add the devices one by one.
If I have everything available why not send it straight away to the 
subsystem and let it do the management?
But ok, I understand your point and I can do the helper to parse the 
DEFSLVS.

Another question:
  How do we know what is the main master in case we want to send back the 
bus mastership?

> 
> > Basically I want to avoid to put this type of logistics in HC driver 
> > layer and call the maintenance_lock.
> 
> And yet, I don't think forging a DEFSLVS frame is the right way to
> provide the kind of abstraction you're talking about. 

Can you explain?

> Note that I said
> a few things should be provided as helpers in my review.
> 
> > 
> > I'm insisting because it seems that I have a different use case to 
> > address and I don't see how this fit on it.
> 
> Can you be more specific, because we don't know about your use cases.

According to the spec the sec master may have all function of a Main 
master and may have all function of a slave.

The implementation should made with this in mind and I'm asking 
flexibility for that. 

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
