Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C508606A32A
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvQhYfX3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B5tFItGvt0MJHIVCJ42YmKixReXax3aN9T3RxNOzaOg=; b=lvQhYfX37Nt8OHH1tLCdYJg5RJ
	MGGtLyDLyQHgNc7vjJMyKsIT4yyq5OGGjai/UuneMIBIQTosdJHzVays9Sl+ZTQgM5Y2Cgu60YZtv
	ZgOtEI7FbEhmz7GCaIvaJ4WEmnYoA0uCSZw3HV5HexJJTQHIdPbgHGaYQOjS9Ss2XyVHMeOC3Clrl
	UgkjGpO3b3mBH4C4Ih+9sjUfMP6y59nVGKpRqKUmb/eDRNOt/iJ4tFToYOERYa+grbZQ4TTIA6skf
	KG3ZmEQg87uc3M7y80BjYeETP8uodS9ouOLrtTKz+dUU4sWvmbwDYdLMGq9W+1vr1chkhuedIe8gR
	9yeemQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrE-0000000BSPJ-3nwh;
	Thu, 19 Nov 2026 09:55:08 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrC-0000000BSOO-16y7
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 09:55:07 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3EAA1A004C;
	Thu, 19 Nov 2026 10:55:03 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BE37A1A003D;
	Thu, 19 Nov 2026 10:55:03 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E5431800068;
	Thu, 19 Nov 2026 17:55:00 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v22 1/5] i3c: hub: Mark downstream DT addresses as desired on parent bus
Date: Thu, 19 Nov 2026 15:24:45 +0530
Message-Id: <20261119095449.555593-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119095449.555593-1-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015506_591528_6997169C 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I3C devices behind hub target ports share the parent controller's
dynamic address space. Their assigned dynamic addresses from Device
Tree must be preserved so that parent DAA does not allocate the same
addresses to other devices.

Previously, the hub reserved these addresses by marking the parent
bus slots as I3C_ADDR_SLOT_I3C_DEV, even though the downstream devices
were not attached to the parent bus. This could cause address
reconciliation to incorrectly treat these slots as occupied by
orphaned I3C devices.

Introduce i3c_bus_set_addr_slot_desired() to mark an address as
desired without changing its current slot status.

Use this helper when processing downstream I3C devices described in
Device Tree. This allows parent DAA to avoid the desired addresses
while keeping the slots free until the corresponding devices are
actually attached.

Keep the desired address markings for the lifetime of the parent bus,
as they represent the fixed Device Tree topology.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v22:
 - Add a generic I3C core fix for downstream DT-assigned address handling
   on the parent bus.
 - Introduce i3c_bus_set_addr_slot_desired() to set
   I3C_ADDR_SLOT_EXT_DESIRED without changing slot occupancy.
 - Avoid treating downstream addresses as orphaned parent-bus devices
   during DAA reconciliation.
 - Preserve downstream address preferences across parent DAA.
---
---
 drivers/i3c/hub.c          | 18 +++++++++++-------
 drivers/i3c/master.c       | 20 ++++++++++++++++++++
 include/linux/i3c/master.h |  2 ++
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
index 539028768084..95eec5b0cada 100644
--- a/drivers/i3c/hub.c
+++ b/drivers/i3c/hub.c
@@ -763,10 +763,15 @@ EXPORT_SYMBOL_GPL(i3c_hub_init);
  * @hubc: I3C hub controller for a target-port virtual bus.
  * @node: Target-port bus Device Tree node.
  *
- * Reserve parent bus address slots for the assigned dynamic address of each
- * downstream I3C device described in the Device Tree, so that parent DAA does
- * not hand the same address to another device. Downstream devices behind hub
- * target ports share the parent controller's dynamic address space.
+ * Mark the assigned dynamic address of each downstream I3C device described in
+ * the Device Tree as desired on the parent bus, so that parent DAA avoids
+ * handing the same address to another device while it is still free.
+ * Downstream devices behind hub target ports share the parent controller's
+ * dynamic address space.
+ *
+ * A desired address is only a preference: the slot stays free, so the parent
+ * does not report it as occupied and address reconciliation does not mistake
+ * it for an orphaned device that has to be probed.
  *
  * The reservations describe a fixed Device Tree topology and are kept for the
  * lifetime of the parent bus; they are not released when a target port is
@@ -816,9 +821,8 @@ int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
 		status = i3c_bus_get_addr_slot_status(&parent->bus,
 						      assigned_addr);
 		if (status == I3C_ADDR_SLOT_FREE)
-			i3c_bus_set_addr_slot_status(&parent->bus,
-						     assigned_addr,
-						     I3C_ADDR_SLOT_I3C_DEV);
+			i3c_bus_set_addr_slot_desired(&parent->bus,
+						      assigned_addr);
 		i3c_bus_maintenance_unlock(&parent->bus);
 	}
 	return 0;
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9928c5dffb5b..146edbc279a3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -448,6 +448,26 @@ void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 }
 EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);
 
+/**
+ * i3c_bus_set_addr_slot_desired() - Mark an I3C address as desired
+ * @bus: I3C bus.
+ * @addr: I3C address preferred by a device.
+ *
+ * Record that a device would like @addr without claiming that a device
+ * already uses it. Dynamic address assignment then avoids @addr while it
+ * is still free, but address reconciliation does not treat it as an
+ * orphaned device.
+ *
+ * The caller must hold the bus maintenance lock.
+ */
+void i3c_bus_set_addr_slot_desired(struct i3c_bus *bus, u16 addr)
+{
+	/* Narrow mask: set the desired flag without touching the status. */
+	i3c_bus_set_addr_slot_status_mask(bus, addr, I3C_ADDR_SLOT_EXT_DESIRED,
+					  I3C_ADDR_SLOT_EXT_DESIRED);
+}
+EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_desired);
+
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
 {
 	enum i3c_addr_slot_status status;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d58070a72a49..6c90ccb41e49 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -793,6 +793,8 @@ i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr);
 void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 				  enum i3c_addr_slot_status status);
 
+void i3c_bus_set_addr_slot_desired(struct i3c_bus *bus, u16 addr);
+
 void i3c_bus_maintenance_lock(struct i3c_bus *bus);
 void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
 #endif /* I3C_MASTER_H */
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
