Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AEB1061B21
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1C8zFf571To/zhB9cy1+45xtKCYz7/2Cg8uQixV6jfE=; b=YWY9VV7k+8nM0V
	6oRravmIFXpoPB650RdIH6gksrNwvOSbskK2rSHgsRxvDAEB8/spFNVpZ1STj0+046562Eb/BvmX5
	J/+irQ2ZFsRI/xen0qBEDW5AmWZ8eaYToKEX5oKNBc3HmZjEVR+qtrLXg9ZrJ4RLV+cPtUK8oqmWW
	cI6+4MwoK9eVV9YMDm6Nl4wn7PcTN7JMtyx6/uG+GV+imyUPOGEgZOEB9EU5m9Y1Of0zrD82hILCx
	+OF4GqCOB6bgxRk3jyKAUIFlOJa/pAD7T8SnqYKOEtMn1GlmTKJXChfXfoBSHQPmDLgSPDCahWiFW
	uQxAsceyUNjIe8fKBgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WJw-0000000CmSh-0Y6Y;
	Tue, 31 Mar 2026 10:27:40 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WJt-0000000CmSB-1W9G
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 10:27:38 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 31 Mar
 2026 18:27:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 18:27:30 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 31 Mar 2026 18:27:30 +0800
Subject: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation for
 final status
MIME-Version: 1.0
Message-ID: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAJGhy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY2ND3UzjZN2M5EzdlNxEXePExFRLA4skk1SLVCWgjoKi1LTMCrBp0bG
 1tQBdlUZGXQAAAA==
X-Change-ID: 20260331-i3c-hci-dma-3aae908b4e8e
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Nicolas Pitre <npitre@baylibre.com>, Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Billy
 Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774952850; l=1768;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=zIgtQhuTmrCeR6fcQehtNEBPNXYnZP35LwWuE5X6gn0=;
 b=R/dEiDaif6flgd6FrXFdKebF7xzjUq2k2wBtVGbbUfG0G+e9RLulivuC1yZHGtLtzdWWQXdoQ
 +0deuL57+wgBGvrOAazNFsowVUkkvbK/vpFi4beCh2J6FhWhhe/+hon
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_032737_408022_527EF97A 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

In DMA mode, the IBI status descriptor encodes the payload using
CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
chunk). All preceding chunks are implicitly full-sized.

The current code accumulates full chunk sizes for non-final status
descriptors, but for the final status descriptor it only adds
DATA_LENGTH. This ignores the contribution of the preceding full
chunks described by the same final status entry.

As a result, the computed IBI payload length is truncated whenever
the final status spans multiple chunks. For example, with a chunk
size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
payload size of 5 bytes, but the current code reports only 1 byte.

Fix the calculation by adding the size of (CHUNKS - 1) full chunks
plus DATA_LENGTH for the last chunk.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index b903a2da1fd1..f4c76f168276 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 		if (!(ibi_status & IBI_LAST_STATUS)) {
 			ibi_size += chunks * rh->ibi_chunk_sz;
 		} else {
+			ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
 			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
 			last_ptr = ptr;
 			break;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-i3c-hci-dma-3aae908b4e8e

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
