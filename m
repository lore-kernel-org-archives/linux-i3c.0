Return-Path: <SRS0=ouzu=FX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3963C4361B
	for <linux-i3c@archiver.kernel.org>; Sat, 19 Dec 2020 07:06:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D4323B5D
	for <linux-i3c@archiver.kernel.org>; Sat, 19 Dec 2020 07:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D4323B5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O3c8GEy9y94F0jmbwlMuF8umOwOaQmjEpsC/4tfSEm4=; b=MMKlWVvKJetb+40Yp1y+rg/tPx
	qzkDiRiGxPbseq9wjUz0MNk2QLgPes6/hEtg4aqfp281m+GcQBca00Q4Ng0E7Kmm2bX/xu1posCKb
	1InO5YiO6Hwd8iepLRtUBVBIiuPtMvCireiXBU7kjL3hqbdnIp5dDySx2WCE29+gzplCQtiY3qFuf
	CciDabtjVDvCvb0LqFqGFUNldLVM+oZjFcagyD2gamrZTY9lhCU5d/8vCMWFdagUgl73QXBSnoXEU
	86xSbVhzBl8rd/N5WiXh4Vd0ujHcSiK2pRuQ2NVNJT28EijWEEV1t8GYJheEg7wEi8tw3ORHuavMH
	LCGyhYfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqWKB-0005Mq-Eb; Sat, 19 Dec 2020 07:06:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqWK9-0005MJ-2O
 for linux-i3c@lists.infradead.org; Sat, 19 Dec 2020 07:06:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C05081F46488;
 Sat, 19 Dec 2020 07:06:37 +0000 (GMT)
Date: Sat, 19 Dec 2020 08:06:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c
 <linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] i3c: Changes for 5.11
Message-ID: <20201219080632.686b92bc@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_020641_243988_A74E1100 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <abelloni@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here the I3C PR for 5.11. This should be my last PR (I resigned from
my maintainer position). Alexandre Belloni (maintainer of the RTC
subsystem) kindly proposed to take over, so he should send the I3C PRs
from now on.

Regards,

Boris 

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.11

for you to fetch changes up to 95393f3e07ab53855b91881692a4a5b52dcdc03c:

  i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning (2020-12-17 10:31:30 +0100)

----------------------------------------------------------------
* Add the HCI driver
* Add a missing destroy_workqueue() in an error path
* Flag Alexandre Belloni as the new maintainer

----------------------------------------------------------------
Boris Brezillon (1):
      i3c: Resign from my maintainer role

Colin Ian King (1):
      i3c/master: Fix uninitialized variable next_addr

Nicolas Pitre (3):
      dt-bindings: i3c: MIPI I3C Host Controller Interface
      i3c/master: introduce the mipi-i3c-hci driver
      i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning

Qinglang Miao (1):
      i3c master: fix missing destroy_workqueue() on error in i3c_master_register

 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml |   47 +++
 MAINTAINERS                                             |    2 +-
 drivers/i3c/master.c                                    |    5 +-
 drivers/i3c/master/Kconfig                              |   13 +
 drivers/i3c/master/Makefile                             |    1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile                |    6 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h                   |   67 ++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c                |  378 +++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c                |  316 ++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/core.c                  |  798 ++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h                   |   32 ++
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c                |  184 ++++++++++
 drivers/i3c/master/mipi-i3c-hci/dct.h                   |   16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c                |   36 ++
 drivers/i3c/master/mipi-i3c-hci/dma.c                   |  784 +++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c              |  308 ++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h              |   19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h                   |  144 ++++++++
 drivers/i3c/master/mipi-i3c-hci/ibi.h                   |   42 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c                   | 1041 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h        |   79 ++++
 21 files changed, 4316 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/Makefile
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/core.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dma.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ibi.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/pio.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
