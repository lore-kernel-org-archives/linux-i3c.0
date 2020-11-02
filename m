Return-Path: <SRS0=wWa5=EI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AF7C2D0A3
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2020 22:22:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17EE02084C
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2020 22:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nvCdnjCo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="Pm/ZqLrJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="axpJorVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EE02084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=POeZEUI/7lztrPzYEbNBT+gelYvIx/vVfOktAfOHJo8=; b=nvCdnjCoxjX5hbwIJ3kkhWRuGr
	2qmrj8A2a3hyGrAh5w13EELCYzBcKeT63xvTm5vBNhU+pbLoMU0iAZpUjeorrOngMmcsN8Yz5hZPo
	DWCZFBpfV73glelQTRGlDeT/fGlisbKRTULxWMfyXc8pqoc+reiwG7vr8kmsGf4NSqqjhgsNM3AhT
	LUiE01R2XfbYxbFTXD3DoyBjnW4Mrr3CghjrO8O0akHBz78gNLfGDsk6oi2/MEw4mU5LNHmd+yIby
	GQNWvi+2JxnvY4K8ud7FZt3JdWkcJzpXU7lwQvRFKKQVFaUr4MhnG8OczRT4GK7y2oI2qRmlXL6HC
	M7BrygXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZiDn-0000X6-KP; Mon, 02 Nov 2020 22:22:39 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZiDh-0000Ut-H1
 for linux-i3c@lists.infradead.org; Mon, 02 Nov 2020 22:22:37 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id EC26F8F794;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=sasl; bh=Ja0Gm+tvpv2X2OGs0LV9M9FMApY=; b=Pm/ZqLrJ8jyU7kTnwsEs
 rOAZewW2VsyxQ1Mzpiz+awrEfKSHefhGGyMr6rO4anvuGu1v3VoR3JaORWjcHNNl
 //lR6fY1jcJLO6qlZ4bQ9PrlkA9t26UFKBkDCHBVsTmnT4q9Ei7rBPfIwPgEjjW1
 vA+TUCA9ROOrxAZxMJfJhQM=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E2F128F793;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=JYm00/J+MypMLfeydmj5yrw5cdZ1uEVQT1iPi8aLrIQ=;
 b=axpJorVhck67K/rybnbfmVxCTmxjBXc+lvQXq1TrRTpW3SpHMDYiQSClIxSRMXMKlLlALVewWbD3fGbTWwY5GV9QgxAIdXldX5dqiEV3s/V1yb6R+alSIpP25he8eVqZiZPPj3xfcK+UNtEhMH74uCXme2nRsAFOt8996i2kF38=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 6073E8F78E;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 6BA842DA0C6C;
 Mon,  2 Nov 2020 17:22:26 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] MIPI I3c HCI (Host Controller Interface) driver
Date: Mon,  2 Nov 2020 17:22:18 -0500
Message-Id: <20201102222220.1785859-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Pobox-Relay-ID: E3AF8A74-1D59-11EB-B52D-74DE23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_172233_660760_97839F2D 
X-CRM114-Status: GOOD (  14.00  )
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

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml   |   45 +
 drivers/i3c/master/Kconfig                      |   13 +
 drivers/i3c/master/Makefile                     |    1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile        |    6 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h           |   67 ++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c        |  378 ++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c        |  309 +++++
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
 19 files changed, 4302 insertions(+)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
