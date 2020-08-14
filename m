Return-Path: <SRS0=RTqP=BY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65757C433E1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3240820716
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ev7yaroS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="DzLPNtjm";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="LKLkIYAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3240820716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mX0Xj/KGPJs/BBU5CHJRCh8y7BD9WqTW/YgaQC8pY/A=; b=Ev7yaroSiu2DwYpvfNtij1XHlb
	higrFLsuoRGadE8BMb/Mu9K62swd1j+uXpRxgxxXE+2Kh9LhfaCNyS7hDLt+s5WNMsq9iQw+PTa7X
	G4cKKU1PLQjwlbJcTbNlDsN7QCaHnaQ9K1R0F0c94N+jqzkxVqzR4/FgWy5qglfEW9dnfUvYk8B4s
	aVBwwAwMZ+ujpQpNTaD6yzhyRP3oM9JO80BPzabmoDUDtyyO/dK5AW2nnDswvGBjV01c1CIi52Jdd
	0iBtQeVEXjTcx+HoNWHro9t1ndcQ1zjylIbK6f3ttmMlEG74XNEaA5HjAdFl2eHaF7HahWGHZehFe
	ggh3kUDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Qid-0000dB-KU
	for linux-i3c@archiver.kernel.org; Fri, 14 Aug 2020 03:49:27 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Qib-0000bX-Gp
 for linux-i3c@lists.infradead.org; Fri, 14 Aug 2020 03:49:26 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id C576F7DE79;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=sasl; bh=3EOAK/AIuTICdHDACnG4b7XirBw=; b=DzLPNtjmOd9REvFVlXbl
 9fSM21sAXWn/bTagCm47BGuSrC4o3Rj5Vg6FjFQmdHQbZaP77B8Aw860GWUGvRK0
 tLloRQSpA0Ix8YL7bhTEenAxTS8upamkmuYhhc49fQdWTwZYBDcozQm2Wfc5HbzA
 4fcOfIh5Atf53jh7mVshEMQ=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id BDC487DE78;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=dPbO6nCZhG8BrQOMkPTrZaHyMFrVur7sPH0FpeDT9Q0=;
 b=LKLkIYAIetAQ+sH0geyPuKrKge/IxbQU1jS4osjhyGirHIZJ8Du0za6LXGyAuFW5zXXfB3BMxuYYo9J3JKfKHqzLpFt5MvkgUCt4vKSPq4k9lVl/ZzAdPSz7ezsa9MP7K+gvgV8MbJni53xGQXorSmkQtezYUNer4eDjjaz2Z74=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 3FEF67DE75;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 4F8112DA0BC7;
 Thu, 13 Aug 2020 23:49:16 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] MIPI I3c HCI (Host Controller Interface) driver
Date: Thu, 13 Aug 2020 23:48:52 -0400
Message-Id: <20200814034854.460830-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Pobox-Relay-ID: 209D6220-DDE1-11EA-9949-2F5D23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_234925_595956_583EE980 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Laura Nixon <laura.nixon@team.mipi.org>,
 Robert Gough <robert.gough@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Nicolas Pitre <npitre@baylibre.com>
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
supported with varying degree due to the above, and of course v2 support
is likely to change as the spec is finalized. But it is included
nevertheless as all I have for testing at the moment is based on
an early v2 draft. Even v1.0 hardware is still scarse so it wasn't
tested yet. As more hardware becomes available for testing it is likely
that adjustments will be needed on top of this. But it is best to have
the code merged earlier so it gains better exposure for future
contributions, etc.

Feedback appreciated.

diffstat:

 .../devicetree/bindings/i3c/mipi-i3c-hci.txt    |  15 +
 drivers/i3c/master/Kconfig                      |  13 +
 drivers/i3c/master/Makefile                     |   1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile        |   9 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h           | 106 ++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c        | 362 +++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c        | 280 +++++
 drivers/i3c/master/mipi-i3c-hci/core.c          | 801 +++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h           |  28 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c        | 170 ++++
 drivers/i3c/master/mipi-i3c-hci/dct.h           |  16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c        |  36 +
 drivers/i3c/master/mipi-i3c-hci/debug.c         |  79 ++
 drivers/i3c/master/mipi-i3c-hci/debug.h         |  17 +
 drivers/i3c/master/mipi-i3c-hci/dma.c           | 767 ++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c      | 249 +++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h      |  19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h           | 150 +++
 drivers/i3c/master/mipi-i3c-hci/ibi.h           |  42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c           | 961 ++++++++++++++++++
 20 files changed, 4121 insertions(+)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
