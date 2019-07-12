Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F878C742B9
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 11:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EAD2083B
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 11:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYDBClq8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dNX/GR8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EAD2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=P0ydQSSdJ2bOLuBXDgUIWqk4qc7Kbn3Orz1bI6R+rQA=; b=BYD
	BClq8aqYKypGLYjDAS8i8WADbDwYnxn4p+JJLQt44l8TyIZwHQ4l1JICP9dBWrhUjz0MhAss5rthj
	1kz3A8rweHuebNUKQPwuSh0YxWZ3QyWK0eUXOh43u9Oc6nXTQKIYt4kV0KBDFn/qsHAxkr3NiloT/
	jlVlCTCqKJLCfFhrIiJAYjYQLP0iXc0Zpw8yIkL3ho3soY7INA/Ea1pHITJiW+vxnyIZKb7jbC+iD
	FOkrcMu27nfnegtiVb6x3Nh1cvJOJRkldC/pfFSo1PF5u+GBJs4pck4SxvbYko3yGtGopIdP5NjXM
	UIBMZJ6BKI+ztvoLNdHENmlUbJD7PwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlu7P-00009T-76; Fri, 12 Jul 2019 11:53:39 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlu7L-00007J-Fi
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 11:53:36 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AEFB1C29BE;
 Fri, 12 Jul 2019 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562932415; bh=Bwpep7STwikCoZMTTU0wnldjsqPyrkJwQldcsqAzApM=;
 h=From:To:Cc:Subject:Date:From;
 b=dNX/GR8NSBXMT8JWtSMb4daS+sUcAd1AUJT8W7txu6BalacxWO8HHtEZOoG6SQsIm
 nkUm8DADsnMpqDcrCbrli4uOdeFvIx4EYoJe+FZUZiPwL7lIeLhCvDUbRzG83On4rt
 oLhMeU2KfF/U+7wZ5f+N0NY+xPDXJatr7IyL9Piay3us5oo41aVuC3UhxcjRNwPuaq
 fdqOZrhD6Y12TBpYjb5NJD5F1TGQ8CuLkUMBNzr+0HBaXb2qsP2hxbXaHYxIhDAt21
 RergnwVg3dX6MI1qiDoX0xdZOguOe3vhuMNuwZ3kAXEg0jsuP1z8v9G7S62kVUi+7o
 NS2Jkg9bBo3QQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5D15AA0061;
 Fri, 12 Jul 2019 11:53:33 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 0F0193E581;
 Fri, 12 Jul 2019 13:53:33 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-iio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add ST lsm6dso i3c support
Date: Fri, 12 Jul 2019 13:53:27 +0200
Message-Id: <cover.1562931742.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_045335_537487_6DE61FD3 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Joao.Pinto@synopsys.com, bbrezillon@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 lorenzo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series add i3c support for STM LSM6DSO and LSM6DSR sensors.

It is also introduced i3c support on regmap api. Due the lack of
i3c devices HDR capables on the market the support for now is only for
i3c sdr mode by using i3c_device_do_priv_xfers() method.

The i3c regmap api is already available in the Git repository at:
  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
  tags/regmap-i3c

Change in v4:
  remover hw_id variable from st_lsm6dsx_i3c_probe()

Change in v3:
  Update st_lsm6dsx_probe() call
  Remove i3c_get_device_id() and use i3c_device_match_id()

Changes in v2:
  Change i3c_get_device_id() to drivers/i3c/device.c
  Add support for LSM6DSR

Vitor Soares (3):
  regmap: add i3c bus support
  i3c: add i3c_get_device_id helper
  iio: imu: st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR

 drivers/base/regmap/Kconfig                 |  6 ++-
 drivers/base/regmap/Makefile                |  1 +
 drivers/base/regmap/regmap-i3c.c            | 60 +++++++++++++++++++++++++++++
 drivers/i3c/device.c                        | 46 ++++++++++++++++++++++
 drivers/i3c/master.c                        | 45 ----------------------
 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 58 ++++++++++++++++++++++++++++
 include/linux/i3c/device.h                  |  4 ++
 include/linux/regmap.h                      | 20 ++++++++++
 10 files changed, 202 insertions(+), 47 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
