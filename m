Return-Path: <SRS0=KKIm=VY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA8CC433FF
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jul 2019 14:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02592075E
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jul 2019 14:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0Mt03QJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02592075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW6W2YxVq1aDkF//x0ojLpt+dHjcpWnaKvLKZy8egbs=; b=H0Mt03QJi9W4C+
	Xz9cDAiSYY37ZA4Ev8i5kpJIYyf6Xuu/wY3ztZEw6CYVOPTsPpWO9tygisUXv+E9esDx97StDU7wc
	vmyHVImqUnG6Lca6QzTRIbpAouEzwi/UoAS7RqRhVWOqu2P+dGOHLUwq6Z6iFXKyM1nEQQfVoXHtI
	0Xi2pSnE5E0XFjk9nPgYIrCqQp9zewttNFwcAAb/uxsu/S1GPrpHSx25ZYuXYqSBujqWDMQFRgsKW
	zICyt/4pkd3rjX9sYvo4bq2CLgTTEfpwUhLx1tcS4KpVZKVvZ/pVItKkFIwd8+Ac6vLGR9UZAy+c7
	dI6ORlJZYeDeinTzf6Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrNQ4-0003Ms-3D; Sat, 27 Jul 2019 14:11:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrK9e-00041J-0g
 for linux-i3c@lists.infradead.org; Sat, 27 Jul 2019 10:42:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0EACC283CED;
 Sat, 27 Jul 2019 11:42:16 +0100 (BST)
Date: Sat, 27 Jul 2019 12:42:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 2/2] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190727124212.3da89d41@collabora.com>
In-Reply-To: <20190721181656.236faa63@archlinux>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
 <77c709aca8607f31f141ee7c4dc28bf89266bd23.1563542515.git.vitor.soares@synopsys.com>
 <20190721181656.236faa63@archlinux>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_034222_195122_4E3E15BE 
X-CRM114-Status: GOOD (  14.44  )
X-Mailman-Approved-At: Sat, 27 Jul 2019 07:11:26 -0700
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
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 linux-i3c@lists.infradead.org, lorenzo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, 21 Jul 2019 18:16:56 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 19 Jul 2019 15:30:55 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> > spi and i2c mode.
> > 
> > The LSM6DSO and LSM6DSR are also i3c capable so let's give i3c support to
> > them.
> > 
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>  
> Great. I'll pick this up once Boris has that immutable branch
> available. Give me a poke if I seem to have lost it!

Here it is:

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/export-i3c_device_match_id

for you to fetch changes up to 934d24a5e1508e73c0001afb54a3916e4270428f:

  i3c: move i3c_device_match_id to device.c and export it (2019-07-27 11:22:19 +0200)

----------------------------------------------------------------
Needed for the st_lsm6dsx_i3c.c driver

----------------------------------------------------------------
Vitor Soares (1):
      i3c: move i3c_device_match_id to device.c and export it

 drivers/i3c/device.c       | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master.c       | 45 ---------------------------------------------
 include/linux/i3c/device.h |  4 ++++
 3 files changed, 57 insertions(+), 45 deletions(-)



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
