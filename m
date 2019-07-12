Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFE8C742CA
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 15:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560FD206B8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 15:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caequIec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560FD206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2LBBM7t5Uppl/zsNLxT7HM2phE6/WCWwVqgqR4myhs=; b=caequIecx3Wk1d
	JAYNnDHv3ES3qFAJmCHdoT8vHJljuEzhTqah5t3xGlCrDntIb41K/pleZkJ3HudbRtD3y+wP8UoPr
	B2/W+ngyo0Sclw6L1Cup5NOL/5GOo3iVP3ZHfWbV9zUuVJezwAguLI+Fi5giAOE7fFuqRd45ObhHb
	5TFGhHlj7ppzJ6YZpJPBgAHp32Lh5UaM7ifEH5U8wtYPAh6cMFOYeFhZ6ZWAwejoa7kX6NKvP2qnj
	mOI0Wov1qY2XUJJOmi+gHWD8NPkonkhb++dzyICG/T2p6j8PQ2bD1HPK5o4oSwh88x/Ok18EgUKJi
	PJ4Caj3g5OGEpxVxm87A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlxw4-0007P3-Oq; Fri, 12 Jul 2019 15:58:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlxw1-0007O0-Ak
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 15:58:11 +0000
Received: from linux.home (2a01cb0c80061e007f541addd69f0d47.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:7f54:1add:d69f:d47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2D5DA28BBDA;
 Fri, 12 Jul 2019 16:58:06 +0100 (BST)
Date: Fri, 12 Jul 2019 17:58:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 0/3] Add ST lsm6dso i3c support
Message-ID: <20190712175803.3e1f3ac8@linux.home>
In-Reply-To: <cover.1562931742.git.vitor.soares@synopsys.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_085809_503969_5F11DD02 
X-CRM114-Status: GOOD (  14.60  )
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
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 lorenzo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 12 Jul 2019 13:53:27 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> This patch series add i3c support for STM LSM6DSO and LSM6DSR sensors.
> 
> It is also introduced i3c support on regmap api. Due the lack of
> i3c devices HDR capables on the market the support for now is only for
> i3c sdr mode by using i3c_device_do_priv_xfers() method.
> 
> The i3c regmap api is already available in the Git repository at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
>   tags/regmap-i3c
> 
> Change in v4:
>   remover hw_id variable from st_lsm6dsx_i3c_probe()
> 
> Change in v3:
>   Update st_lsm6dsx_probe() call
>   Remove i3c_get_device_id() and use i3c_device_match_id()

Did not receive this v3...

> 
> Changes in v2:
>   Change i3c_get_device_id() to drivers/i3c/device.c
>   Add support for LSM6DSR
> 
> Vitor Soares (3):
>   regmap: add i3c bus support
>   i3c: add i3c_get_device_id helper
>   iio: imu: st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR
> 
>  drivers/base/regmap/Kconfig                 |  6 ++-
>  drivers/base/regmap/Makefile                |  1 +
>  drivers/base/regmap/regmap-i3c.c            | 60 +++++++++++++++++++++++++++++
>  drivers/i3c/device.c                        | 46 ++++++++++++++++++++++
>  drivers/i3c/master.c                        | 45 ----------------------
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 58 ++++++++++++++++++++++++++++
>  include/linux/i3c/device.h                  |  4 ++
>  include/linux/regmap.h                      | 20 ++++++++++
>  10 files changed, 202 insertions(+), 47 deletions(-)
>  create mode 100644 drivers/base/regmap/regmap-i3c.c
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
