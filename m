Return-Path: <SRS0=88uS=5D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596F7C5ACD6
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D6F720757
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 15:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBgSPuQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D6F720757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVj5BHX7xhYlNtO9JUKXtbY2Cz7yjmWmpT1q8ZC/We8=; b=lBgSPuQ9tOno/N
	4iL/VsEyyl5j7SOZ8fAbNpqQxKuUn641CBb3e/lEjEjo20B4y6xraU7qDKY2H7lNdKaSqpaBNv8dQ
	izgyfAyFYeRsevi6Vjt2fFxR4bGWsMNHORjqXFkR3Kvox83hFlfleVbp3CiPW8UWxxXfWjm4uFxRM
	c9gul4dLoSxsqmaDorCHEjO/7Jw3AwOggpDlGqLXBBYPUIhZPY5AnaYoiz9kc6lY8E4piAvAHC67X
	lb6yPp+VmsmKo2E0HFnUS+kWH17KsSnBwqZcGquepENNcGdHp/6rYq0WAcPLNDsISqht7w39sA4Rx
	DRHtd5ImZHSqNDHhS9jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaCE-0001W1-Rz; Wed, 18 Mar 2020 15:01:26 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEaBx-0000Ud-Tl
 for linux-i3c@lists.infradead.org; Wed, 18 Mar 2020 15:01:12 +0000
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
 by pokefinder.org (Postfix) with ESMTPSA id C9FB72C097D;
 Wed, 18 Mar 2020 16:01:04 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary addresses
Date: Wed, 18 Mar 2020 16:00:53 +0100
Message-Id: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_080110_249072_474AFE15 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
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

First the changes since V1 for those familiar with this series:

* old patch 1 dropped, not needed anymore after some reimplementation
  here
* added tags from last revision (except for patches 5+6 because there
  were changes in code)
* patch 5 has a better of-iterator which respects now that addresses
  might have different #address-cells and such
* patch 6 now puts the device it obtained
* one more "dummy" removed fromt the binding docs

TODO: make sure there are no concurrency issues in patch 6 when handling
the struct i2c_client.

Many thanks to Geert and Luca for the review and discussions!

And here the cover-letter for V1:

One outcome of my dynamic address assignment RFC series[1] was that we
need a way to describe an I2C bus in DT fully. This includes unknown
devices and devices requiring multiple addresses. This series implements
that.

Patches 1 does some preparational refactoring. After patch 2, we can
have child nodes with an address, but no compatible. Those addresses
will be marked busy now. They are handled by the dummy driver as well,
but named "reserved" instead of dummy. Patches 3+4 are again some
preparational refactoring. After patch 5, all addresses in a 'reg' array
are now blocked by the I2C core, also using the dummy driver but named
"reserved". So, we can have something like this:

	reserved@13 {
	       reg = <0x13>, <0x14>;
	};

After patch 6 then, i2c_new_ancillary_device is spiced up to look for
such a reserved address and return it as a good-old "dummy" device.
Sanity checks include that only a sibling from the same DT node can
request such an ancillary address. Stealing addresses from other drivers
is not possible anymore. This is something I envisioned for some time
now and I am quite happy with the implementation and how things work.

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

Wolfram Sang (6):
  i2c: use DEFINE for the dummy driver name
  i2c: allow DT nodes without 'compatible'
  i2c: of: remove superfluous parameter from exported function
  i2c: of: error message unification
  i2c: of: mark a whole array of regs as reserved
  i2c: core: hand over reserved devices when requesting ancillary
    addresses

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  2 -
 Documentation/devicetree/bindings/i2c/i2c.txt |  4 +-
 drivers/i2c/i2c-core-base.c                   | 33 +++++--
 drivers/i2c/i2c-core-of.c                     | 89 +++++++++++--------
 drivers/i2c/i2c-core.h                        |  3 +
 drivers/i3c/master.c                          |  2 +-
 include/linux/i2c.h                           |  6 +-
 7 files changed, 88 insertions(+), 51 deletions(-)

-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
