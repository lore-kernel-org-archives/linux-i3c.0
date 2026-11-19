Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C8606A320
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eyC/S1c1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=oGIGjE11;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=AOIzVdJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dkH+2VirJn9TNPF8ANMF6Jz6pcwEvQa8RUgT5omObDU=; b=eyC/S1c1gGLCYCIWLLhb7t+soC
	hpWETFrDdlP5Wd6/ehdq0+H2ARfRdptcppbb8N0C3oUwU3aSGbW6y1rXoZ5PfG66bA28/vmPgNCuf
	WW+JT9qDPxUzq0GQAM5tD5+DVgr3/DnruVO6Nz5UzUlDYkuKK9PU5OoWXE7R9Wjv1xWIdINRoOiGi
	TPv+wn4411QssGwzAi9DuoPAELu+4nFVY1V+DHv38S2ppVOck/9lxI3Swl2BsZB9ZARJMQ8bAm6A0
	j22wNKDcT8O49LXoPxn/Z0Gjaiz1PT0XHpU/sInPhgWCijd4Q1J4LHzyosLcc9M8zUJYpxfZQYohN
	avbD40gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2de-0000000C93Y-0Uq1;
	Thu, 19 Nov 2026 13:57:22 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2db-0000000C92k-2wcm
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 13:57:21 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJDGrUS2521117;
	Thu, 19 Nov 2026 05:57:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pfptdkimsnps; bh=onYMe7z4
	5MNHNaZv+QbTHmbUjD9ItNkD2Eo0MoSvp60=; b=oGIGjE11xNIazy4c0yrVeUvo
	Qas/GKCtfwnlKFTfic3XxfwJJK8oeRBz5ITeXknWNHt27HjoCnaidZs8Rdgc8ohK
	gkYsRlu1OaV3CQZ+pxOKwCzxA5DtmWgul3/HtNoS78AjCSSEYhNHdLxIfQl6i1wX
	qb5REE0+pZQXklD1S8zVXYRozaejMN2JcsLC1tYQEcWNF6NhEag/b2gRQ793qG/J
	e1jM1fXibHD7NYU8/vJmr7pW3G33C0MUcBlVWXVfgGAxNXOG4dsIqP+/Ts+SIU35
	6Lj0p2D4LufYBUsSdWG6q+8OAm+4+ojI4aXxQZno+qS+haL5XPVKOF0eRiXMYw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4j1ny44agb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 05:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795096635; bh=+4f0NTweHkkjxxVxq8bcb7YppIRlVgUdeTIheSnclQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AOIzVdJjFMSOqqk4jOLde35yRzaBL9cZe8PGJqgpvhapoIu9qKtwS/397XyjdFPLZ
	 C4XLrddkxyu244ovoAN7DsMT3l1NvVCoace66MYEeeRd5wRgntwEFxSCeGRCuv0dLl
	 DafPgqllyBfkt4OJezAoa4c91z2JG2ChWc/bxbAfM/z82gkFGBxsgAeFTA1Ngpdjey
	 YVPCyDyBV5VhEIXZgyslcRoc+UP5aoDSSRJE2kiCx0Eqq5NcY98ymYGGqBKskcjau8
	 b8TCJiBf6OGfMC4fyXtLu/wiCa4OoqeHJFKGzhooCIdE/mumzTmEha7obD+AdLUQY4
	 DX3jr17Q4c2nQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AD47C401E8;
	Thu, 19 Nov 2026 13:57:14 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.8.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 8A9ADA0883;
	Thu, 19 Nov 2026 13:57:11 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: Dineshkumar.Parameswaran@synopsys.com
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
Date: Thu, 19 Nov 2026 19:27:03 +0530
Message-Id: <20261119135703.22729-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111021151.58380-1-parame@synopsys.com>
References: <20261111021151.58380-1-parame@synopsys.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6aff003c cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22 a=jIQo8A4GAAAA:8
 a=6ICTioi8pyFgEHTiPqgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfX9WhEFf2ByOpr
 ZvEADCr2cXoci/pzIodQqCOinw7Ec50eNJOlLhNFMfB/9GamIORUixbdK2QNT4Q0Z7XOQ33fqRH
 u+95CbOOvDfDp3HXKe8Hl2VV8+VbawDNTNjHbYrCeYkfNS+U73WLQUZG+GuPpXoflrN7Lwisz/N
 95/rkLJ1JMvUKzZp0d0FxGvx06ONODWenoUDxUnLcOAuFqjopuxQMtFIcYFYyY1yfCZeUyW3dW8
 +Ppn5nsZaSb80u+iSflRQQ1EB0tYFid2mgZePCz3226Ks3MY8uFhJMGfbDJjMLJq8lexPzLYdw0
 dWDBWeBopCMs8vxuU/7bgNHxhg+LD/wMJCrWs1BdJxD6AtN5la+IR2YnUW5oMAPmDrK1bMwskrK
 oYpiC4zr/+Xh8u3Sv8sp6rz/KNrEU7MU5SA2QU8WYA3HqEG8fjCnKWzkeH64jJKDhrigkPhOurb
 PFrWSCh0WM1uxYSVJTQ==
X-Proofpoint-ORIG-GUID: Dn0O0Q3-ywMTXZBx0QwpVDPBMEFNZ41E
X-Proofpoint-GUID: Dn0O0Q3-ywMTXZBx0QwpVDPBMEFNZ41E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfXxAI8bA9V+1Bd
 RO9R8n29mhs3aDvk9ewMI5tI/Yqof0opGWRtMKNWmehofcLLTDDamCqxUT4ZlW0s/rBHivBdXI+
 lLnqVbLBqCTjALo7MXd3k1NAQ4zUQiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611190055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055719_873698_62E15359 
X-CRM114-Status: GOOD (  19.72  )
X-Spam-Score: -2.8 (--)
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

Implement HDR-DDR transfer support for the DesignWare Controller.
Only support for private transfers and does not support sending CCC
commands in HDR mode.

Key differences:
- Sets the speed to HDR_DDR_SPEED(6) and COMMAND_PORT_CP to do
data transfer in HDR-DDR mode. Hardware will generate the ENTHDR0
based on this.
- HDR exit pattern will generated from the hardware when it sees
the TOC on HDR-DDR mode.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
changes in v4:
- Fixed using HDR-DDR cmd direction instead of using rnw directly.

 drivers/i3c/master/dw-i3c-master.c | 41 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05584ddaf104..d94e7a6d28f9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -65,6 +65,8 @@
 #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
 #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
 
+#define HDR_DDR_CMD_READ		0x80
+
 #define RESPONSE_QUEUE_PORT		0x10
 #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
 #define RESPONSE_NO_ERROR		0
@@ -232,6 +234,8 @@
 #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
 #define I3C_BUS_THIGH_MAX_NS		41
 
+#define DW_I3C_HDR_DDR_SPEED	6
+
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 
@@ -381,6 +385,11 @@ static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
 	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
 }
 
+static bool dw_cmd_is_read(u32 rnw_cmd, enum i3c_xfer_mode mode)
+{
+	return (mode == I3C_HDR_DDR) ? (rnw_cmd & HDR_DDR_CMD_READ) : rnw_cmd;
+}
+
 static struct dw_i3c_xfer *
 dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 {
@@ -726,6 +735,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 
+	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
 		goto rpm_out;
@@ -962,7 +973,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned int nrxwords = 0, ntxwords = 0;
+	unsigned int nrxwords = 0, ntxwords = 0, rnw_cmd;
+	bool rnw;
 	int i, ret = 0;
 
 	if (!i3c_nxfers)
@@ -972,7 +984,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		return -EOPNOTSUPP;
 
 	for (i = 0; i < i3c_nxfers; i++) {
-		if (i3c_xfers[i].rnw)
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
+
+		if (rnw)
 			nrxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 		else
 			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
@@ -995,28 +1010,36 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	}
 
 	for (i = 0; i < i3c_nxfers; i++) {
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
 		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
 			COMMAND_PORT_TRANSFER_ARG;
 
-		if (i3c_xfers[i].rnw) {
+		if (rnw) {
 			cmd->rx_buf = i3c_xfers[i].data.in;
 			cmd->rx_len = i3c_xfers[i].len;
-			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
-				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
+			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
 
 		} else {
 			cmd->tx_buf = i3c_xfers[i].data.out;
 			cmd->tx_len = i3c_xfers[i].len;
-			cmd->cmd_lo =
-				COMMAND_PORT_SPEED(dev->info.max_write_ds);
 		}
 
 		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
 			       COMMAND_PORT_DEV_INDEX(data->index) |
 			       COMMAND_PORT_ROC;
 
+		if (mode == I3C_HDR_DDR) {
+			cmd->cmd_lo |= COMMAND_PORT_CMD(rnw_cmd) | COMMAND_PORT_CP |
+				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+		} else {
+			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
+				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
+				COMMAND_PORT_SPEED(dev->info.max_write_ds);
+		}
+
 		if (i == (i3c_nxfers - 1))
 			cmd->cmd_lo |= COMMAND_PORT_TOC;
 	}
@@ -1027,8 +1050,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
+		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		rnw = dw_cmd_is_read(rnw_cmd, mode);
 
-		if (i3c_xfers[i].rnw)
+		if (rnw)
 			i3c_xfers[i].len = cmd->rx_len;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
