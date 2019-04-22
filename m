Return-Path: <SRS0=YsXQ=SY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26395C10F11
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 15:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E894E2077C
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 15:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GttwG9he";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HVv5sJ2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E894E2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ID82cAMBu+Tdk/1lMxrBqCbMLR0iCkw5F0Hc/dpc8w=; b=GttwG9he3V8a1/
	Ho95v4RIWj7c8WVqisxenkFnIC9j6WRu30xuu1D2FB3I2cOgPd7l+zgmry37Ea+Vqh8EJP7LaqHkN
	XGqH4lawrjhcEbZHB1FeiTW1T2Td7PudWKe6MU28WS2rd6wzdKwg70oEWOvnI8xTIUy4d6xhujjJz
	cdj+B3pJeB1ObPYGlZAulGW7TXmL2I3Qone+Nuc1ytLyWtX9rqGTC5+GQLxAcyMCxcoiEIjYP7nXz
	QZl8uu+4Rx5RHZ+IZtYkp3A/I/ZvyTGq+pkFnmVOKDFIQNcyD+ZPodxxekTrqC7ErEfPl3h1REwMl
	c9j53Zj9KUqRz82uOaQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIbHE-0006zP-G5; Mon, 22 Apr 2019 15:54:40 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIbHB-0006yv-V2
 for linux-i3c@lists.infradead.org; Mon, 22 Apr 2019 15:54:39 +0000
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED630C0BD6;
 Mon, 22 Apr 2019 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555948476; bh=1MiHX4WJjuEps8SgRtgA4ugQkedawkGQJSBuMRLPFgE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HVv5sJ2Lq1z8Cze4OcLMGmICx0v5JeQveJgvEg8nChOhDn0X+j9mI5/egNkfTajce
 HdU/bAa3mHvLW8xteFsvySKaDQmPCY7vAmBiOQWNqkzkJeKm6qRa0pX5xqQB2AX3Cw
 4lHr4nUzKqG+0SL9drxYaCV9nSQYTYSC87N2e4BMbxaX/VXVFfNskZcm3YaHcUgm7+
 ecU9XSsA837L9jXqoeswel9TC2Iy2Gq+biwjhgx9th2FRD4MoELuWf3CejqvhaGcUk
 G//qgOtAXVrpev1sQ0eZXjVu8up8JRV8YQayziljwQElrBHsq3xIdheCALS2fkh+ru
 bWYV44k6GXjlg==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1B0D6A0065;
 Mon, 22 Apr 2019 15:54:36 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 22 Apr 2019 08:54:36 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 22 Apr 2019 17:54:34 +0200
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Topic: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Index: AQHU87sLhgtQ1+d000+4YAeSeMHzMaY+J6iAgACom0D//+7fAIAJjifg
Date: Mon, 22 Apr 2019 15:54:33 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A61B3B4@DE02WEMBXB.internal.synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <05fdeea79db83970e9ecb0d7045b4dd98f206f06.1555350118.git.vitor.soares@synopsys.com>
 <20190416075041.22f8e849@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61596D@DE02WEMBXB.internal.synopsys.com>
 <20190416165250.0606e5a2@collabora.com>
In-Reply-To: <20190416165250.0606e5a2@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctZTk5NGY4YWUtNjUxNi0xMWU5LTgyM2EtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XGU5OTRmOGFmLTY1MTYtMTFlOS04MjNhLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iNTY4NyIgdD0iMTMyMDA0MjIwNzE5MjU0?=
 =?us-ascii?Q?Njk4IiBoPSJOZkF2cGxxS0l2Nzg5K3QrRGZjblBWbXhrWWc9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUNx?=
 =?us-ascii?Q?ek5Lc0kvblVBZmowMEVuNWxXV1crUFRRU2ZtVlpaWU9BQUFBQUFBQUFBQUFB?=
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
X-CRM114-CacheID: sfid-20190422_085438_009639_DA440953 
X-CRM114-Status: GOOD (  32.42  )
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

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, Apr 16, 2019 at 15:52:50

> On Tue, 16 Apr 2019 14:24:57 +0000
> Vitor Soares <vitor.soares@synopsys.com> wrote:
> 
> > Hi Boris,
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Tue, Apr 16, 2019 at 06:50:41
> > 
> > > On Mon, 15 Apr 2019 20:46:41 +0200
> > > Vitor Soares <vitor.soares@synopsys.com> wrote:
> > >   
> > > > Currently in case of mixed slow bus topologie and all i2c devices
> > > > support FM+ speed, the i3c subsystem limite the SCL to FM speed.  
> > >   
> > 
> > I will it replace with your message below.
> > 
> > > "
> > > Currently the I3C framework limits SCL frequency to FM speed when
> > > dealing with a mixed slow bus, even if all I2C devices are FM+ capable.
> > > "
> > >   
> > > > Also in case on mixed slow bus mode the max speed for both
> > > > i2c or i3c transfers is FM or FM+.  
> > > 
> > > Looks like you're basically repeating what you said above.  
> > 
> > What I meant was that I3C framework isn't limiting the I3C speed in case 
> > of mixed slow bus.
> 
> Oh, okay, then maybe something like
> 
> "
> The core was also not accounting for I3C speed limitations when
> operating in mixed slow mode and was erroneously using FM+ speed as the
> max I2C speed when operating in mixed fast mode.
> "

Sounds good to me. Thanks for the advise.

> 
> > 
> > >   
> > > > 
> > > > This patch fix the definition of i2c and i3c scl rate based on bus  
> > > 
> > > 	     ^fixes					      on the bus
> > >   
> > > > topologie and LVR[4] if no user input.  
> > > 
> > >   ^topology		^if the rate is not already specified by the user.
> > >   
> > > > In case of mixed slow mode the i3c scl rate is overridden.  
> > > 
> > > 							   ^ with the max
> > > I2C rate.
> > >   
> > > > 
> > > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > > Cc: <stable@vger.kernel.org>
> > > > Cc: <linux-kernel@vger.kernel.org>
> > > > ---
> > > >  drivers/i3c/master.c | 39 +++++++++++++++++++++++++--------------
> > > >  1 file changed, 25 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > index 909c2ad..1c4a86a 100644
> > > > --- a/drivers/i3c/master.c
> > > > +++ b/drivers/i3c/master.c
> > > > @@ -564,20 +564,30 @@ static const struct device_type i3c_masterdev_type = {
> > > >  	.groups	= i3c_masterdev_groups,
> > > >  };
> > > >  
> > > > -int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
> > > > +int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
> > > > +		     unsigned long i2c_scl_rate)  
> > > 
> > > 
> > > Can we rename the last arg into max_i2c_scl_rate?  
> > 
> > The i2c_scl_rate is base on LVR[4] bit and the user can set a higher scl 
> > rate, this is reason I didn't named it to max_i2c_scl_rate.
> > But if you think that make more sense I'm ok with that.
> 
> In this context it does encode the maximum rate allowed by the spec
> (based on LVR parsing), so max_i2c_rate sounds like a correct name to
> me.
> 
> > 
> > >   
> > > >  {
> > > >  	i3cbus->mode = mode;
> > > >  
> > > > -	if (!i3cbus->scl_rate.i3c)
> > > > -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > -
> > > > -	if (!i3cbus->scl_rate.i2c) {
> > > > -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > > > -		else
> > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > > > +	switch (i3cbus->mode) {
> > > > +	case I3C_BUS_MODE_PURE:
> > > > +		if (!i3cbus->scl_rate.i3c)
> > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > +		break;
> > > > +	case I3C_BUS_MODE_MIXED_FAST:
> > > > +		if (!i3cbus->scl_rate.i3c)
> > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > +		if (!i3cbus->scl_rate.i2c)
> > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > +		break;
> > > > +	case I3C_BUS_MODE_MIXED_SLOW:
> > > > +		if (!i3cbus->scl_rate.i2c)
> > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > +		i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;  
> > > 
> > > Maybe we should do
> > > 
> > > 		if (!i3cbus->scl_rate.i3c ||
> > > 		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> > > 			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> > > 					   
> > > Just in case the I3C rate forced by the user is lower than the max I2C
> > > rate.  
> > 
> > That was something that I considered but TBH it isn't a real use case.
> 
> Add a WARN_ON() to at least catch such inconsistencies. And maybe we
> should add a dev_warn() when the user-defined rates do not match
> the mode/LVR constraints. It's easy to do a mistake when writing a dts.

I think the WARN_ON() is too evasive on the screen and won't provide the 
information we want.
The dev_warn() should work perfectly here.

		if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
			dev_warn(&i3cbus->cur_master->dev->dev,
				     "%s: i3c-scl-hz lower then i2c-scl-hz\n",  __func__);
		if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE ||
		    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE)
			dev_warn(&i3cbus->cur_master->dev->dev,
				     "%s: i2c-scl-hz not defined according MIPI I3C spec\n", 
				     __func__);

Maybe it make more sense to do this check on of_populate_i3c_bus(), what 
do you think?





_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
