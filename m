Return-Path: <SRS0=t7CV=ER=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D845C388F9
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F822087D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgS7dQbX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="M4M7ohi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="lCxjsR4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F822087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVdGptqYxBiWtJVExijps7eGjGerK8FnUnZWX77A+fs=; b=NgS7dQbXmSP9102FvAcNaMsaFy
	RZAQqm5IDALJTtV7pJ+V82iYDT4Nl1/bUefp1RdrQ/yQZePfnStJsjbFaFdg5Kiv7YyOwhinHJ2Tj
	wgV7SyTnLoHQvROWpV+IawkzkvfjLLxTgVyp/Yc4yZV4AZlJPOyXZJAweWTBZvWhALyYHdMOgxPq0
	z0Z0Ryry+2ERPK35ZBTd72zbovLhIWxr7Q733qWg6EXnzRaB0a4hidz8pdPZ5JWI9U82yLoOsKjSI
	u5oQKmi8IIPgWwItFhyl7aHLl/pW5ZxIKB+WZWfRO/bD4Kk+7Ia9u58Fpq27RoCsAbUEBkkpC+u0W
	OU09wD3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcyF3-0005mo-Gt; Wed, 11 Nov 2020 22:05:25 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcyEz-0005lo-Dr
 for linux-i3c@lists.infradead.org; Wed, 11 Nov 2020 22:05:23 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id B1A2B8F548;
 Wed, 11 Nov 2020 17:05:17 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=sasl; bh=E//uRR2nFQA31lM9inCSH7aKwHU=; b=M4M7ohi9N82/PrQu7R9V
 zS+49LwADY7FYOSg6mbMsfnT5sWSC6i3pLa2NICXr7C9AgTwZsn6P8Okeg8qnONo
 TXfxqrsGYyAExy7xLzoUOQassYzCgHjb/vafZfC7HgT7O99148gk2m77v5vGOOZu
 5RNySMZU6lbQZKrdlOqUK9c=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id A834C8F53C;
 Wed, 11 Nov 2020 17:05:17 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=iuYeLfGSxfbsmwNzXA6nMpGernQyFh11QJk1DlxXeXE=;
 b=lCxjsR4kOx/gjWRjEyFW+DtD5BgU4r8auXIz4Dil6vzqgy8mKeprbuJYW7TaoLg/O2iBFKTBs7CRM0vG6fzHM8OFNeHqMBbCwdRfOIwMI6I6KM5SepO0xRPQdXyKlH8Ii19O/pG9dPWjjlzLUAodWg2kyrevSuue115MJkhwZ1E=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 212AF8F522;
 Wed, 11 Nov 2020 17:05:17 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 136C72DA0CCA;
 Wed, 11 Nov 2020 17:05:16 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH v4 0/2] MIPI I3c HCI (Host Controller Interface) driver
Date: Wed, 11 Nov 2020 17:05:08 -0500
Message-Id: <20201111220510.3622216-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Pobox-Relay-ID: FB5297F4-2469-11EB-B9F0-D152C8D8090B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_170521_566871_9F9136CC 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Laura Nixon <laura.nixon@team.mipi.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Gough <robert.gough@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>,
 Nicolas Pitre <npitre@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The MIPI I3C HCI (Host Controller Interface) specification defines
a common software driver interface to support compliant MIPI I3C
host controller hardware implementations from multiple vendors. This
is the initial Linux driver implementing support for this specification.

Due to limitations in the I3C subsystem, this driver doesn't implement
everything the spec specifies. For example, scheduled commands,
auto-commands and NCM are major features not yet supported.

There are different revisions of the spec: v1.0, v1.1 (to be released
imminently), and 2.0 (still under active development). All of them are
supported with varying degree due to the above. And of course v2 support
is likely to change as the spec is finalized, but it is included now
as all I have for testing at the moment is based on the latest v2 draft.

Even v1.0 hardware is still scarce so it hasn't been tested yet. As more
hardware becomes available for testing it is expected that adjustments
will be needed on top of this submission. But it is best to have the
current code merged earlier so to gain better exposure and to create
an incentive for future contributions.

Feedback appreciated.

Changes from v3:

- add mandatory "additionalProperties" and Rob's reviewed_by to
  the DT bindings description
- split PID/BCR/DCR values from the RX FIFO during DAA according
  to the latest HCI 2.0 draft
- fix a warning identified by kernel test robot

Changes from v2:

- resync with latest draft of HCI v1.1 and v2 specs, especially the v2 cmd
  descriptor format and new error codes
- more extended capability table parsing from the v2 spec
- tightened PIO error handling somewhat
- minor cosmetic changes
- precision on the DT binding based on Rob Herring's review
- small changes based on Miquel Raynal's review
- small changes based on Boris Brezillon's review
- some more small changes based on Sakari Ailus' review

Changes from v1:

- moved DT binding to schema format (Rob)
- fix sparse warnings (kernel test robot)
- fix build warnings on 32-bit targets (kernel test robot)
- avoid PIO_OFFSET symbol conflict (kernel test robot)
- minor cosmetic changes

diffstat:

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml   |   47 +
 drivers/i3c/master/Kconfig                      |   13 +
 drivers/i3c/master/Makefile                     |    1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile        |    6 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h           |   67 ++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c        |  378 ++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c        |  316 +++++
 drivers/i3c/master/mipi-i3c-hci/core.c          |  798 +++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h           |   32 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c        |  184 +++
 drivers/i3c/master/mipi-i3c-hci/dct.h           |   16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c        |   36 +
 drivers/i3c/master/mipi-i3c-hci/dma.c           |  784 +++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c      |  308 +++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h      |   19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h           |  144 +++
 drivers/i3c/master/mipi-i3c-hci/ibi.h           |   42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c           | 1041 +++++++++++++++++
 .../i3c/master/mipi-i3c-hci/xfer_mode_rate.h    |   79 ++
 19 files changed, 4311 insertions(+)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
