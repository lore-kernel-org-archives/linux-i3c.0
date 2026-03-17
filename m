Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5615FD8740
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Mar 2026 11:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWWHKOv1FTGSOG/8YgBBDe26VRM9JINGTreiFHUkKQ0=; b=MBI/IHhMnTK5uN
	/Fyp8Tn7+2GpiUhFGnXbDzG/DEUFmMcwcaWMQE0LRSYe/cdghP/FeGMAiHLih5z2Zz8DgC02LyIb9
	h17U9gvWX9GDVN+tPTOmGmLJljiynkxcHDVUJWnD1STvQibCMLOYQzbAbOeJ93zEjBcVSQA4OmNcr
	f28ZZpYfWheCB1dRf0/kMKD9S2U8IXj10hqABaVIrY0e+KJRjwzSX2RfCgidLoFC1cBchkCVvS5I4
	mu4UOqFbFw4IJod4Ojj0xOJNj/g1G4QSTVH+Cjfj/IlX1UWOPQOzQW3bNBkFYK3cKDeUE+qr39/82
	hNUCLJ3GSI7Wzx3RWjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sfg-000000069KM-25kT;
	Tue, 17 Mar 2026 11:33:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sff-000000069Je-0Dfp
	for linux-i3c@lists.infradead.org;
	Tue, 17 Mar 2026 11:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6106D60103;
	Tue, 17 Mar 2026 11:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4091BC2BCB1;
	Tue, 17 Mar 2026 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773747190;
	bh=5U2mMX/BlLBee1LSdlSImz7BsVRSpnc0P2jc+ihhZZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mbyn+2ydh6nb/DaXAHMR6d/LaQ1K02bDSbe9iM4mfaIrIH6QtXRtdEhL4yo9QlMcy
	 vWHFijTiNJko/1eYrtOGZdvq6I3TvhSFYwPGXfjyQBXsLLukeoU81C4bwV7Lc81dqj
	 oZqgjzIYAK6CVCr5ypcPHPadaAVuDrdwMMJYkX4OZ4iNT1esr3AX66SP+BtBKxCrx/
	 b6QkG2eArDhwbJ521Q8RWg3b9A93xtLfpystIwSB7gSbrlP45UHxP4P5q4Ei+QrVhc
	 PGQyvuD24oK/EeQ4EKfsD3gmIi6BZL2gRvvWoYjQpNdlKPLqjPsm1HB466h9KcB7e0
	 gflvrJCEMXM8Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peter Yin <peteryin.openbmc@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
Date: Tue, 17 Mar 2026 07:32:46 -0400
Message-ID: <20260317113249.117771-15-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317113249.117771-1-sashal@kernel.org>
References: <20260317113249.117771-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.8
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Peter Yin <peteryin.openbmc@gmail.com>

[ Upstream commit f26ecaa0f0abfe5db173416214098a00d3b7db79 ]

The DesignWare I3C master driver creates a virtual I2C adapter to
provide backward compatibility with I2C devices. However, the current
implementation does not associate this virtual adapter with any
Device Tree node.

Propagate the of_node from the I3C master platform device to the
virtual I2C adapter's device structure. This ensures that standard
I2C aliases are correctly resolved and bus numbering remains consistent.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260302075645.1492766-1-peteryin.openbmc@gmail.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have the complete picture.

## Analysis

### What the commit fixes

The DesignWare I3C master driver creates a virtual I2C adapter
(`master->base.i2c`) for backward compatibility. When this adapter is
registered via `i3c_master_register()` ->
`i3c_master_i2c_adapter_init()` -> `i2c_add_adapter()`, the I2C core
calls `of_i2c_register_devices(adap)` (at `i2c-core-base.c:1593`).

The critical code in `of_i2c_register_devices()` at `i2c-core-of.c:90`:
```c
if (!adap->dev.of_node)
    return;
```

**Without this fix**, `adap->dev.of_node` is NULL, so
`of_i2c_register_devices()` returns immediately without registering any
I2C child devices described in the device tree. This means **I2C devices
under the I3C master node in the DT will never be discovered or
registered**.

### Bug severity

This is a real functional bug. On systems using Device Tree (most
ARM/embedded systems where this driver is used - OpenBMC systems, etc.),
I2C devices behind the DW I3C master won't be enumerated. The author's
email (`peteryin.openbmc@gmail.com`) confirms this is from an OpenBMC
context where DT-based I2C device discovery is essential.

### Stable criteria assessment

- **Fixes a real bug**: Yes - I2C devices behind I3C master are not
  discovered from DT
- **Obviously correct**: Yes - `device_set_of_node_from_dev` is a well-
  established helper, and propagating the parent's of_node to a virtual
  adapter is standard practice
- **Small and contained**: Yes - single line addition in one file
- **No new features**: Correct - this restores expected functionality
  (DT device discovery)
- **Reviewed**: Yes - by Frank Li at NXP (an I3C hardware vendor)

### Risk assessment

Very low risk. The change adds one call to
`device_set_of_node_from_dev()` before `i3c_master_register()`. The
function safely handles refcounting (does `of_node_put` on old,
`of_node_get` on new). If the pdev has no of_node, it's a no-op (NULL ->
NULL).

### Verification

- Read `dw-i3c-master.c:1616-1618`: confirmed the current code has no
  of_node propagation before `i3c_master_register()`
- Read `drivers/i3c/master.c:2554-2574`: confirmed
  `i3c_master_i2c_adapter_init()` sets `adap->dev.parent` but NOT
  `adap->dev.of_node`
- Read `drivers/i2c/i2c-core-of.c:84-91`: confirmed
  `of_i2c_register_devices()` returns immediately if `adap->dev.of_node`
  is NULL - this is the concrete bug mechanism
- Read `drivers/i2c/i2c-core-base.c:1593`: confirmed
  `of_i2c_register_devices()` is called during adapter registration
- git log confirmed the dw-i3c-master.c has existed for a long time and
  this code path is established
- The fix pattern (propagating of_node to virtual/child devices) is
  standard across the kernel

### Concerns

- The commit doesn't have a `Fixes:` tag pointing to the original commit
  that created the driver, but as noted in the guidelines, this is
  expected for commits under review
- No dependency on other patches - this is fully self-contained
- The `device_set_of_node_from_dev()` function has been available since
  kernel 5.x, so this should apply cleanly to all active stable trees
  that have the DW I3C driver

This is a clear bug fix: I2C devices described in Device Tree under an
I3C master node are silently not discovered because the virtual I2C
adapter lacks the of_node needed by the I2C core's DT enumeration. The
fix is a single, safe, well-reviewed line.

**YES**

 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4033bc16677ff..aa683894e6de9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1614,6 +1614,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		pm_runtime_get_noresume(&pdev->dev);
 
 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
+
+	device_set_of_node_from_dev(&master->base.i2c.dev, &pdev->dev);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
