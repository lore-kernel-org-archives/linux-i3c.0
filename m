Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E95C282E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB45620693
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tsEw4RxO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB45620693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okz7tkhbXLk2GAqZF9qNMirRn7mPt7B1shxVfD6dirM=; b=tsEw4RxONq80LJ
	S/gwvLFeT2WhmyAxlKrhEpPVYgbr5cvmWawUhG+ilGkLjr1m4siSbKaKUa2eazwD8wAolCI1CGpOg
	h4JRzvtUP3yI5osv5Lbu6JLdtLDTlSyKy7A88REcVfHgVCtPXRB6SBK2EIY+rbmCmjvHF2K6w32VL
	rINkIznsYrJ2rastwDrk7KmYKhrfY0cHJ0UnRnQd1JGO6smWvpVhPJ1xscrP5ukgAwhywKK13a+0l
	JLZAZ0FhW2aF0OaQoJGZ42ZeW1ZgcUI2CqdgqVpwYKm0qTAXenWvPkNYePeAV4pNH2c0ZIkebCCZT
	Pbe3E9n1Or73+BBXyaGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGM0q-0001Fv-9A; Tue, 16 Apr 2019 11:12:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGHeJ-0005Yh-Ae
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 06:32:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6499A260C42;
 Tue, 16 Apr 2019 07:32:53 +0100 (BST)
Date: Tue, 16 Apr 2019 08:32:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH 0/3] Add ST lsm6dso i3c suppport
Message-ID: <20190416083250.272edfe1@collabora.com>
In-Reply-To: <cover.1555354268.git.vitor.soares@synopsys.com>
References: <cover.1555354268.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_233255_499792_D66E44F6 
X-CRM114-Status: GOOD (  10.63  )
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:12:26 -0700
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
Cc: lars@metafoo.de, bbrezillon@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, joao.pinto@synopsys.com, rafael@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, lorenzo.bianconi83@gmail.com, linux-i3c@lists.infradead.org,
 jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 15 Apr 2019 21:19:38 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

I like the very detailed description in your cover letter :P.
Anyway, glad to see I3C support added to regmap. Also happy to have a
new driver for an I3C device.

Thanks for working on that.

Boris

> Vitor Soares (3):
>   remap: Add i3c bus support
>   i3c: Add i3c_get_device_id helper
>   iio: imu: st_lsm6dsx: Add i3c basic support
> 
>  drivers/base/regmap/Kconfig                 |  6 ++-
>  drivers/base/regmap/Makefile                |  1 +
>  drivers/base/regmap/regmap-i3c.c            | 62 ++++++++++++++++++++++++++
>  drivers/i3c/device.c                        |  8 ++++
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 67 +++++++++++++++++++++++++++++
>  include/linux/i3c/device.h                  |  1 +
>  include/linux/regmap.h                      | 20 +++++++++
>  9 files changed, 172 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/base/regmap/regmap-i3c.c
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
