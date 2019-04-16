Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6804C282DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 16:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D402087C
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 16:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNuA9P8K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mY6ohycQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D402087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RKibGBGsUISgUuNUCbCk9Y3c2Wq3W/SwDZuCawrxhI=; b=GNuA9P8KZrPsqd
	ycS4KWsxcBVLbCSADE+UqsEq/zqrDe+qSLA6uhHAkpK2d8BchRQQN/FL/nQFofAuGBKrefT8dXVgk
	vUA25eWV8w+zp9kT5mTEsyGo/K5FGSN4+MVdxCEGjMy8T3hBa2ENDI967M0nKBFkeNpqIcyxS1v40
	FGD30O31OTSYAMMFraI7awyQHHQ9YYnBOrNbOHoiVOl6MZyZJUQvpYJF0IF9zoXx5LWMLngn5DbbI
	u3bU1genZrApOTbuiS3NCZOK+ovE/3aiJP/jSJMQ9sjXSz3SKGy5iGhQtz5jzjZa5mAtVcTpUb8CX
	8Ni8SH7EVhJk47VkvJDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGR1Z-0004vZ-7V; Tue, 16 Apr 2019 16:33:33 +0000
Received: from smtprelay4.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGPHZ-0007IH-Gf
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 14:42:02 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id F091924E0AF7;
 Tue, 16 Apr 2019 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555425717; bh=Mj2KYnT4wlRC5r8lnNcWpsLPIcNxiWsbVnWdATMOHA4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=mY6ohycQhmg9iijkpmPqGLSlLpYEhSM8FGzJiXY6fT2dsCoLXQMnKyz4FbO1sBLn4
 +9sScwgReWOw0F6W0grOyuQeTPri/P9FLcefkaqkhsnRkhzzX+rfNRWlb86lkNMfDy
 Bm29ajAu5EJ9abczZrFi60Rpn3VEZcjvSoQKBLEjOLfw8thHq1xbVgNbWjK/TVWMWI
 r2goeS/W9hL6EH/GUxXz1o4UrbdeCKyNd4Fwg+bXGdMRnC+YAAuOmrIlt+Xdyz/8vU
 Lsp/5JEnXdoJQI4KOtV8S+ddsDZI+X3v1G3V0sZWJTjYac2UHwMs93kIIcm04bjv+t
 UYQf+4MiK5clA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B438AA0079;
 Tue, 16 Apr 2019 14:41:53 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 16 Apr 2019 07:41:53 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Tue, 16 Apr 2019 16:41:51 +0200
From: Vitor Soares <vitor.soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Subject: RE: [PATCH 1/3] remap: Add I3C bus support
Thread-Topic: [PATCH 1/3] remap: Add I3C bus support
Thread-Index: AQHU88A1Iwl3j+G7wk6IBdZcVvxAIqY+LqaAgACruZA=
Date: Tue, 16 Apr 2019 14:41:50 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A615995@DE02WEMBXB.internal.synopsys.com>
References: <cover.1555354268.git.vitor.soares@synopsys.com>
 <c38e3cb9e8524af58c995a9cf1f79ddba69b47b4.1555354268.git.vitor.soares@synopsys.com>
 <20190416081551.6f21bc38@collabora.com>
In-Reply-To: <20190416081551.6f21bc38@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYzFhMmVmOTctNjA1NS0xMWU5LTgyM2EtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XGMxYTJlZjk4LTYwNTUtMTFlOS04MjNhLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iNjUwMSIgdD0iMTMxOTk4OTkzMDg4MTA5?=
 =?us-ascii?Q?ODI0IiBoPSJ1VmM1TUx0WmlSbFN4enpKeHlreUJ2ZHdhR289IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUFB?=
 =?us-ascii?Q?M2JtRll2VFVBWFRvRVkrcjR5NzdkT2dSajZ2akx2c09BQUFBQUFBQUFBQUFB?=
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
X-CRM114-CacheID: sfid-20190416_074157_563600_8A25C6EB 
X-CRM114-Status: GOOD (  26.67  )
X-Mailman-Approved-At: Tue, 16 Apr 2019 09:33:32 -0700
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
Cc: "lars@metafoo.de" <lars@metafoo.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "joao.pinto@synopsys.com" <joao.pinto@synopsys.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, Apr 16, 2019 at 07:15:51

> Typo in the subject: s/remap/regmap/
> 
> On Mon, 15 Apr 2019 21:19:39 +0200
> Vitor Soares <vitor.soares@synopsys.com> wrote:
> 
> > Add basic support for I3C bus.
> > This is a simple implementation that only give support
> > for Read and Write commands.
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/base/regmap/Kconfig      |  6 +++-
> >  drivers/base/regmap/Makefile     |  1 +
> >  drivers/base/regmap/regmap-i3c.c | 62 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/regmap.h           | 20 +++++++++++++
> >  4 files changed, 88 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/base/regmap/regmap-i3c.c
> > 
> > diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> > index 6ad5ef4..c8bbf53 100644
> > --- a/drivers/base/regmap/Kconfig
> > +++ b/drivers/base/regmap/Kconfig
> > @@ -4,7 +4,7 @@
> >  # subsystems should select the appropriate symbols.
> >  
> >  config REGMAP
> > -	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ)
> > +	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
> >  	select IRQ_DOMAIN if REGMAP_IRQ
> >  	bool
> >  
> > @@ -49,3 +49,7 @@ config REGMAP_SOUNDWIRE
> >  config REGMAP_SCCB
> >  	tristate
> >  	depends on I2C
> > +
> > +config REGMAP_I3C
> > +	tristate
> > +	depends on I3C
> > diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
> > index f5b4e88..ff6c7d8 100644
> > --- a/drivers/base/regmap/Makefile
> > +++ b/drivers/base/regmap/Makefile
> > @@ -16,3 +16,4 @@ obj-$(CONFIG_REGMAP_IRQ) += regmap-irq.o
> >  obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
> >  obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
> >  obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
> > +obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
> > diff --git a/drivers/base/regmap/regmap-i3c.c b/drivers/base/regmap/regmap-i3c.c
> > new file mode 100644
> > index 0000000..565997b
> > --- /dev/null
> > +++ b/drivers/base/regmap/regmap-i3c.c
> > @@ -0,0 +1,62 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> > + *
> > + * Author: Vitor Soares <vitor.soares@synopsys.com>
> > + */
> > +
> > +#include <linux/regmap.h>
> > +#include <linux/i3c/device.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/module.h>
> > +
> > +static int regmap_i3c_write(void *context, const void *data, size_t count)
> > +{
> > +	struct device *dev = context;
> > +	struct i3c_device *i3c = dev_to_i3cdev(dev);
> > +	struct i3c_priv_xfer xfers[] = {
> > +		{
> > +			.rnw = false,
> > +			.len = count,
> > +			.data.out = data,
> > +		},
> > +	};
> > +
> > +	return i3c_device_do_priv_xfers(i3c, xfers, 1);
> > +}
> > +
> > +static int regmap_i3c_read(void *context,
> > +			   const void *reg, size_t reg_size,
> > +			   void *val, size_t val_size)
> > +{
> > +	struct device *dev = context;
> > +	struct i3c_device *i3c = dev_to_i3cdev(dev);
> > +	struct i3c_priv_xfer xfers[2];
> > +
> > +	xfers[0].rnw = false;
> > +	xfers[0].len = reg_size;
> > +	xfers[0].data.out = reg;
> > +
> > +	xfers[1].rnw = true;
> > +	xfers[1].len = val_size;
> > +	xfers[1].data.in = val;
> > +
> > +	return i3c_device_do_priv_xfers(i3c, xfers, 2);
> > +}
> > +
> > +static struct regmap_bus regmap_i3c = {
> > +	.write = regmap_i3c_write,
> > +	.read = regmap_i3c_read,
> > +};
> > +
> > +struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
> > +				      const struct regmap_config *config,
> > +				      struct lock_class_key *lock_key,
> > +				      const char *lock_name)
> > +{
> > +	return __devm_regmap_init(&i3c->dev, &regmap_i3c, &i3c->dev, config,
> > +				  lock_key, lock_name);
> > +}
> > +EXPORT_SYMBOL_GPL(__devm_regmap_init_i3c);
> > +
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> > index daeec7d..f65984d 100644
> > --- a/include/linux/regmap.h
> > +++ b/include/linux/regmap.h
> > @@ -25,6 +25,7 @@ struct module;
> >  struct clk;
> >  struct device;
> >  struct i2c_client;
> > +struct i3c_device;
> >  struct irq_domain;
> >  struct slim_device;
> >  struct spi_device;
> > @@ -624,6 +625,10 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
> >  				 const struct regmap_config *config,
> >  				 struct lock_class_key *lock_key,
> >  				 const char *lock_name);
> > +struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
> > +				 const struct regmap_config *config,
> > +				 struct lock_class_key *lock_key,
> > +				 const char *lock_name);
> >  /*
> >   * Wrapper for regmap_init macros to include a unique lockdep key and name
> >   * for each call. No-op if CONFIG_LOCKDEP is not set.
> > @@ -982,6 +987,21 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
> >  #define devm_regmap_init_slimbus(slimbus, config)			\
> >  	__regmap_lockdep_wrapper(__devm_regmap_init_slimbus, #config,	\
> >  				slimbus, config)
> > +
> > +/**
> > + * devm_regmap_init_i3c() - Initialise managed register map
> 
> Maybe we should have a more specific name here, as some might want to
> access registers using HDR modes (devm_regmap_init_i3c_sdr()?)

That make sense if the device with HDR capability is able to do 
everything in HDR mode and I'm not sure about that.
I would like to wait for a couple of commercial devices before that 
change.

> 
> 
> > + *
> > + * @i3c: Device that will be interacted with
> > + * @config: Configuration for register map
> > + *
> > + * The return value will be an ERR_PTR() on error or a valid pointer
> > + * to a struct regmap.  The regmap will be automatically freed by the
> > + * device management code.
> > + */
> > +#define devm_regmap_init_i3c(i3c, config)				\
> > +	__regmap_lockdep_wrapper(__devm_regmap_init_i3c, #config,	\
> > +				i3c, config)
> > +
> >  int regmap_mmio_attach_clk(struct regmap *map, struct clk *clk);
> >  void regmap_mmio_detach_clk(struct regmap *map);
> >  void regmap_exit(struct regmap *map);


Thanks for your feedback.

Best regards,
Vitor Soares


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
