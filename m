Return-Path: <SRS0=YsXQ=SY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D07C282CE
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 19:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41D2204EC
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 19:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKMwiMaU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MG7deAZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41D2204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKRZ8apqNAjW1H3FVqvLfxjzMvVVth9Y3MtotTvNpeY=; b=cKMwiMaUmeHWt2
	hmYu0ggoY7aVuLBkqBUfiiIFN2pWf1jM6v/dQDzBQ8auMeJD5D/p+Y1kEhTYIUHgT/HBm88thcrki
	/EIdDDXn7NDEfnW+RUwd935jFdHH5HE+n2Y6GtCvy3ZN2mGxu6OSkxHZm9wFD8MPh01DRXxaO5mWf
	yahvYJkHlC/NFuFpJkVm2jlnZ0kjEx9kkSsatI1yVMDW1tsqxYoJz1mlYGaAQr95HVxnj1lW2jgs9
	6WtCgz+W01c+nCSFM9swXKQEYmvidoDUAj/TVn7guLXC/lRdcRwJtBf0ZvIsSY0OAZub4h/8f6Ogw
	UwL5N7b8IlgZ/HzFNtrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIf6Z-0001zG-8L; Mon, 22 Apr 2019 19:59:55 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIf6V-0001yk-Py
 for linux-i3c@lists.infradead.org; Mon, 22 Apr 2019 19:59:53 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CB17C1D59;
 Mon, 22 Apr 2019 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555963192; bh=0pzuSZDe+YDVHBQl+rZ9SNNaa+nSK4zrMGUGaRn5lNo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MG7deAZ/XzWPKNxC/T+M1kTlvXiiqPGga1HTwHnIcXIfAhCQfZDH3hqs+POWLLiJ2
 FD0MmQneon9sjkEmO7zKCam0yQGTebCDGzP5JvuUEBSzesq/Yl2MemT/RgOdUCiWny
 cEJHeWoy+RRVZE/JhYoKehscAa77Y/EnNqsE9jahFWZFWl3gKLzPkH6czDZxXdMeD5
 I5Fcw6Wq73HdpDLHr4iogzvu5numm3v7zwt/kWzOqMSU/NIAEi/+Aw6LCsiTZ3Td09
 YtKiX797YoCyQ197gtzZLGqWcOqFQyoc4F9jUlZeJ5+2wGx5oiO58JwMSb7hjZ81jJ
 ur1iQDaxW3nVA==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C56DA005D;
 Mon, 22 Apr 2019 19:59:49 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 22 Apr 2019 12:59:49 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 22 Apr 2019 21:59:47 +0200
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Topic: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Index: AQHU87sLhgtQ1+d000+4YAeSeMHzMaY+J6iAgACom0D//+7fAIAJjifg///0oYCAADajAP//8I4AAAU08HA=
Date: Mon, 22 Apr 2019 19:59:46 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A61C658@DE02WEMBXB.internal.synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <05fdeea79db83970e9ecb0d7045b4dd98f206f06.1555350118.git.vitor.soares@synopsys.com>
 <20190416075041.22f8e849@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61596D@DE02WEMBXB.internal.synopsys.com>
 <20190416165250.0606e5a2@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61B3B4@DE02WEMBXB.internal.synopsys.com>
 <20190422180715.40abe1b9@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61C415@DE02WEMBXB.internal.synopsys.com>
 <20190422202732.0d539af3@collabora.com>
In-Reply-To: <20190422202732.0d539af3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMjlmOTIyZmItNjUzOS0xMWU5LTgyM2ItZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XDI5ZjkyMmZjLTY1MzktMTFlOS04MjNiLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iNDc5MSIgdD0iMTMyMDA0MzY3ODIzNDY4?=
 =?us-ascii?Q?MTIyIiBoPSJFbTZRa2lmZDJTSHZBQ3BZUysyWHRkTnBRbGM9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJh?=
 =?us-ascii?Q?OXVyc1JmblVBUklOdjNrUnloS2NFZzIvZVJIS0Vwd09BQUFBQUFBQUFBQUFB?=
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
x-originating-ip: [10.13.178.24]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_125951_854235_947964EC 
X-CRM114-Status: GOOD (  23.07  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "joao.pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, Apr 22, 2019 at 19:27:32

> On Mon, 22 Apr 2019 17:54:29 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > > > > > >       
> > > > > > > >  {
> > > > > > > >  	i3cbus->mode = mode;
> > > > > > > >  
> > > > > > > > -	if (!i3cbus->scl_rate.i3c)
> > > > > > > > -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > > > > -
> > > > > > > > -	if (!i3cbus->scl_rate.i2c) {
> > > > > > > > -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> > > > > > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > > > > > > > -		else
> > > > > > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > > > > > > > +	switch (i3cbus->mode) {
> > > > > > > > +	case I3C_BUS_MODE_PURE:
> > > > > > > > +		if (!i3cbus->scl_rate.i3c)
> > > > > > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > > > > +		break;
> > > > > > > > +	case I3C_BUS_MODE_MIXED_FAST:
> > > > > > > > +		if (!i3cbus->scl_rate.i3c)
> > > > > > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > > > > +		if (!i3cbus->scl_rate.i2c)
> > > > > > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > > > > > +		break;
> > > > > > > > +	case I3C_BUS_MODE_MIXED_SLOW:
> > > > > > > > +		if (!i3cbus->scl_rate.i2c)
> > > > > > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > > > > > +		i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;      
> > > > > > > 
> > > > > > > Maybe we should do
> > > > > > > 
> > > > > > > 		if (!i3cbus->scl_rate.i3c ||
> > > > > > > 		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> > > > > > > 			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> > > > > > > 					   
> > > > > > > Just in case the I3C rate forced by the user is lower than the max I2C
> > > > > > > rate.      
> > > > > > 
> > > > > > That was something that I considered but TBH it isn't a real use case.    
> > > > > 
> > > > > Add a WARN_ON() to at least catch such inconsistencies. And maybe we
> > > > > should add a dev_warn() when the user-defined rates do not match
> > > > > the mode/LVR constraints. It's easy to do a mistake when writing a dts.    
> > > > 
> > > > I think the WARN_ON() is too evasive on the screen and won't provide the 
> > > > information we want.
> > > > The dev_warn() should work perfectly here.
> > > > 
> > > > 		if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
> > > > 			dev_warn(&i3cbus->cur_master->dev->dev,
> > > > 				     "%s: i3c-scl-hz lower then i2c-scl-hz\n",  __func__);  
> > > 
> > > Using dev_warn() sounds good, though I don't think you need the
> > > __func__ here. Also, please print the i2c/i3c rates in the message, and
> > > align the second line on the open parens.
> > >   
> > > > 		if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE ||
> > > > 		    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE)
> > > > 			dev_warn(&i3cbus->cur_master->dev->dev,
> > > > 				     "%s: i2c-scl-hz not defined according MIPI I3C spec\n", 
> > > > 				     __func__);  
> > > 
> > > Is that really a problem? Having an i2c rate that is less than FM speed
> > > sounds like a valid case to me.  
> > 
> > I'm addressing the spec constrains.
> 
> "Table 57 I3C Timing Requirements When Communicating With I2C Legacy
> Devices" says that freq can be between 0 and 400KHz when operating in
> slow(FM) mode.

That is the definition of Fast-mode:
"Fast-mode devices can receive and transmit at up to 400kbit/s" as per 
i2c spec.
So this way the slaves can be connected to Standard Mode bus... you 
already know that.

For the FM requirements in I3C bus, please refer to I3C FAQ Q2.2 and 
table 56 of I3C v1.0 basic spec.

> Yes, maximum rate when not specified otherwise is
> 400Khz, 

By default you will have always FM or FM+ due the LVR register be 
mandatory.

> but the point of overloading the max I2C/I3C spec is to allow
> custom rates when the default/spec ones are not achievable, so I'm not
> sure complaining in that case is legitimate.
> 

Well, if the users aren't able to achieve at least FM is because 
something is not correct.

> We should definitely complain when one tries to set a maximum rate that
> is higher than what devices can do (i3cbus->scl_rate.i2c >
> max_i2c_scl_rate).
> 

I can put another if() for such cases.

> Same goes for I3C communications, we shouldn't care when the forced rate
> is lower than what the bus is capable of, what's important is to
> complain when it's higher than what's supported.

The point is complain when scl_rate.i3c < scl_rate.i2c because it can be 
error from user.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
