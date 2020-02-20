Return-Path: <SRS0=uEpj=4I=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CAAC11D15
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CF824673
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2020 17:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHm6FPVn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CF824673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0B+bsyLzFgqGsekOaV89dN1mr8xUC/8XexgIIzym7EU=; b=VHm6FPVnkTabSx
	LEfgeHbKB0DUp8nG/aKh9D7XquJlr64Z4/KQhLUMs0cQdti8dq9fhxujHPfQspVJSuhAGRo/HnJvv
	B3RGMGZCUtQSGX5xoGRs3KDJWnx97N39WwBS5XJ8XSQcXo0tF8l/lMCCQTKmVDpBRN2bAKWs/zGZp
	NnE+/e9ZUpFyU5o/OLrxvnEK4Aq43XKl929CYdciIAy9T6I6o7mg+F2RDO7/IM/aCpL5YmHGEcGC9
	ZCeWWqEWaOoaW/L3TxqbJzDuPqIPm0nnM/LIueMWiqRtC4bwYscwKr3qFSc+hWhxg6/yOCJu2jNzO
	t9zSyO5q8ANmOqntHASg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4pak-0007oe-Qp; Thu, 20 Feb 2020 17:26:26 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4paG-0007EK-3M
 for linux-i3c@lists.infradead.org; Thu, 20 Feb 2020 17:25:59 +0000
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
 by pokefinder.org (Postfix) with ESMTPSA id 40FB52C07FE;
 Thu, 20 Feb 2020 18:25:50 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 0/7] i2c: of: reserve unknown and ancillary addresses
Date: Thu, 20 Feb 2020 18:23:56 +0100
Message-Id: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_092556_525351_208E2F73 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran@bingham.xyz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca@lucaceresoli.net>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

One outcome of my dynamic address assignment RFC series[1] was that we
need a way to describe an I2C bus in DT fully. This includes unknown
devices and devices requiring multiple addresses. This series implements
that.

Patches 1+2 do some preparational refactoring. After patch 3, we can
have child nodes with an address, but no compatible. Those addresses
will be marked busy now. They are handled by the dummy driver as well,
but named "reserved" instead of dummy. Patches 4+5 are again some
preparational refactoring. After patch 6, all addresses in a 'reg' array
are now blocked by the I2C core, also using the dummy driver but named
"reserved". So, we can have something like this:

	dummy@13 {
	       reg = <0x13>, <0x14>;
	};

After patch 7 then, i2c_new_ancillary_device is spiced up to look for
such a reserved address and return it as a good-old "dummy" device.
Sanity checks include that only a sibling from the same DT node can
request such an ancillary address. Stealing addresses from other drivers
is not possible anymore. This is something I envisioned for some time
now and I am quite happy with the implementation and how things work

There is only one thing giving me some headache now. There is a danger
of a regression maybe. If someone has multiple 'reg' entries in the DT
but never used i2c_new_ancillary_device but i2c_new_dummy_device, then
things will break now because i2c_new_dummy_device has not enough
information to convert a "reserved" device to a "dummy" one. It will
just see the address as busy. However, all binding documentations I
found which use 'reg' as an array correctly use
i2c_new_ancillary_device. On the other hand, my search strategy for
finding such bindings and DTs do not feel perfect to me. Maybe there are
also some more corner cases in this area, so this series is still RFC.

And some more documentation is needed. Before that, though, the generic
I2C binding docs need some overhaul, too.

All tested on a Renesas Lager board (R-Car H2). A git branch can be
found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c_alias_device_v2

The I3C list is on CC not only because there is 1-line change in their
subsystem, but maybe also because they need to be aware of these changes
for their I2C fallback? I don't really know, let me know if you are not
interested.

Looking forward to comments!

Happy hacking,

   Wolfram

[1] https://www.spinics.net/lists/linux-i2c/msg43291.html


Wolfram Sang (7):
  i2c: add sanity check for parameter of i2c_verify_client()
  i2c: use DEFINE for the dummy driver name
  i2c: allow DT nodes without 'compatible'
  i2c: of: remove superfluous parameter from exported function
  i2c: of: error message unification
  i2c: of: mark a whole array of regs as reserved
  i2c: core: hand over reserved devices when requesting ancillary
    addresses

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  1 -
 Documentation/devicetree/bindings/i2c/i2c.txt |  4 +-
 drivers/i2c/i2c-core-base.c                   | 29 +++++--
 drivers/i2c/i2c-core-of.c                     | 86 +++++++++++--------
 drivers/i2c/i2c-core.h                        |  3 +
 drivers/i3c/master.c                          |  2 +-
 include/linux/i2c.h                           |  6 +-
 7 files changed, 83 insertions(+), 48 deletions(-)

-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
