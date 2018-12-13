Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_MIXED_ES,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050F0C65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:45:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2FC20870
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDhZJmJP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixzqg9VA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2FC20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqQhm9xgGrlSfpGVgaSpIVLjMXMQTzTyBrT0TgTMpIg=; b=JDhZJmJPM6AIuo
	8WhToH+IWvb612Ay1z6IjdGmKmjDW0a1sazmAOu2mIVkscRX6+oGJuh3tlJ/TmJjuXEp9JWW2pnZb
	qDawbmWFGZT+ls1luIWaYQc3ofSrgulKyxR8OTqx1uo7jOyNN8XrSePONcYYwPYlbyJnWV64+HV6W
	RFwQV36aVR+km3CI6PdvM9Boo3ZGMK5tGSQdcxP9sPh9F7MSFPfphe9Smze3WDoyI0tzJOPO3HT/p
	WwCm0SkU2Btnw4Vhhq4RQhIjbFm1Y3fA5d92vuoMBfzmCCM7VWIn1cNvmFyIlMn3yXwJ63b/N2hM+
	I+ORTH59vOsADg+VIgAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQMl-0006hC-DS; Thu, 13 Dec 2018 12:45:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQMh-0006BZ-VS
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:45:21 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B34720870;
 Thu, 13 Dec 2018 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544705109;
 bh=N/5FI+IupEFEkMOYEh2muLNY6/lYnMPmVKuEsQ+OE8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ixzqg9VANlVSpSXIUeYpGVpgI907pr+T4xM6OupaoqidqH8k3oSvl9WXV2bvzYgm5
 9cm/Tu3Kuqlgv1ViXclXUHCJidUc3LqJIBb5hgUZO4bKwo8TBWz2Q8j2fxkvYEupJI
 aEwPL0/qDB4AfO7npMf5sp1NlmGazMr1CmyE6wyg=
Date: Thu, 13 Dec 2018 13:45:02 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 2/2] i3c: master: cdns: Add support for HDR-DDR mode
Message-ID: <20181213134502.101f5fa5@bbrezillon>
In-Reply-To: <adcd3c336c8285483b1741b145cad945bc813ce9.1544702829.git.pgaj@cadence.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <adcd3c336c8285483b1741b145cad945bc813ce9.1544702829.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_044520_050442_C733E0C8 
X-CRM114-Status: GOOD (  18.13  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 13 Dec 2018 12:18:32 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> Cadence I3C master controller HDR-DDR mode support.
> 
> This feature was originally created by Boris Brezillon
> <boris.brezillon@bootlin.com>. I made some changes/fixes.

Same here.

> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 195 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 193 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index a33f3a6..b1a97be 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -571,7 +571,7 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
>  	     !(status0 & MST_STATUS0_CMDR_EMP);
>  	     status0 = readl(master->regs + MST_STATUS0)) {
>  		struct cdns_i3c_cmd *cmd;
> -		u32 cmdr, rx_len, id;
> +		u32 cmdr, rx_len, id, xfer_bytes;
>  
>  		cmdr = readl(master->regs + CMDR);
>  		id = CMDR_CMDID(cmdr);
> @@ -581,7 +581,11 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
>  			continue;
>  
>  		cmd = &xfer->cmds[CMDR_CMDID(cmdr)];
> -		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
> +		xfer_bytes = CMDR_XFER_BYTES(cmdr);
> +		if(cmd->cmd0 & CMD0_FIFO_IS_DDR)
> +			xfer_bytes = xfer_bytes * 4;
> +		rx_len = min_t(u32, xfer_bytes, cmd->rx_len);
> +
>  		cdns_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
>  		cmd->error = CMDR_ERROR(cmdr);
>  	}
> @@ -893,6 +897,192 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>  	return ret;
>  }
>  
> +#define I3C_DDR_FIRST_DATA_WORD_PREAMBLE	0x2
> +#define I3C_DDR_DATA_WORD_PREAMBLE		0x3
> +
> +#define I3C_DDR_PREAMBLE(p)			((p) << 18)
> +
> +static u32 prepare_ddr_word(u16 payload)
> +{
> +	u32 ret;
> +	u16 pb;
> +
> +	ret = (u32)payload << 2;
> +
> +	/* Calculate parity. */
> +	pb = (payload >> 15) ^ (payload >> 13) ^ (payload >> 11) ^
> +	     (payload >> 9) ^ (payload >> 7) ^ (payload >> 5) ^
> +	     (payload >> 3) ^ (payload >> 1);
> +	ret |= (pb & 1) << 1;
> +	pb = (payload >> 14) ^ (payload >> 12) ^ (payload >> 10) ^
> +	     (payload >> 8) ^ (payload >> 6) ^ (payload >> 4) ^
> +	     (payload >> 2) ^ payload ^ 1;
> +	ret |= (pb & 1);
> +
> +	return ret;
> +}
> +
> +static u32 prepare_ddr_data_word(u16 data, bool first)
> +{
> +	return prepare_ddr_word(data) |
> +	       I3C_DDR_PREAMBLE(first ?
> +			        I3C_DDR_FIRST_DATA_WORD_PREAMBLE :
> +				I3C_DDR_DATA_WORD_PREAMBLE);
> +}
> +
> +#define I3C_DDR_READ_CMD	BIT(15)
> +
> +static u32 prepare_ddr_cmd_word(u16 cmd)
> +{
> +	return prepare_ddr_word(cmd) | I3C_DDR_PREAMBLE(1);
> +}
> +
> +static u32 prepare_ddr_crc_word(u8 crc5)
> +{
> +	return (((u32)crc5 & 0x1f) << 9) | (0xc << 14) |
> +	       I3C_DDR_PREAMBLE(1);
> +}
> +
> +static u32 prepare_ddr_parity_bit(u32 cmdword)
> +{
> +	u16 pb;
> +
> +	pb = (cmdword >> 14) ^ (cmdword >> 12) ^ (cmdword >> 10) ^
> +	     (cmdword >> 8) ^ (cmdword >> 6) ^ (cmdword >> 4) ^
> +	     (cmdword >> 2);
> +
> +	if (pb & 1)
> +		cmdword |= BIT(0);
> +
> +	return cmdword;
> +}
> +
> +static u8 update_crc5(u8 crc5, u16 word)
> +{
> +	u8 crc0;
> +	int i;
> +
> +	/*
> +	 * crc0 = next_data_bit ^ crc[4]
> +	 *                1         2            3       4
> +	 * crc[4:0] = { crc[3:2], crc[1]^crc0, crc[0], crc0 }
> +	 */
> +	for (i = 15; i >= 0; --i) {
> +		crc0 = ((word >> i) ^ (crc5 >> 4)) & 0x1;
> +		crc5 = ((crc5 << 1) & 0x1a) |
> +		       (((crc5 >> 1) ^ crc0) << 2) |
> +		       crc0;
> +	}
> +
> +	return crc5 & 0x1f;
> +}
> +
> +static int cdns_i3c_master_send_hdr_cmd(struct i3c_dev_desc *dev,
> +					const struct i3c_hdr_cmd *cmds,
> +					int ncmds)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> +	int ret, i, ntxwords = 1, nrxwords = 0;
> +	struct cdns_i3c_xfer *xfer;
> +	struct cdns_i3c_cmd *ccmd;
> +	u16 cmdword, datain;
> +	u32 checkword, word;
> +	u32 *buf = NULL;
> +	u8 crc5;
> +
> +	if (ncmds < 1)
> +		return 0;
> +
> +	if (ncmds > 1 || cmds[0].ndatawords > CMD0_FIFO_PL_LEN_MAX)
> +		return -ENOTSUPP;
> +
> +	if (cmds[0].mode != I3C_HDR_DDR)
> +		return -ENOTSUPP;
> +
> +	cmdword = ((u16)cmds[0].code << 8) | (dev->info.dyn_addr << 1);
> +	if (cmdword & I3C_DDR_READ_CMD)
> +		nrxwords += cmds[0].ndatawords + 1;
> +	else
> +		ntxwords += cmds[0].ndatawords + 1;
> +
> +	if (ntxwords > master->caps.txfifodepth ||
> +	    nrxwords > master->caps.rxfifodepth)
> +		return -ENOTSUPP;
> +
> +	buf = kzalloc((nrxwords + ntxwords) * sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	xfer = cdns_i3c_master_alloc_xfer(master, 2);
> +	if (!xfer) {
> +		ret = -ENOMEM;
> +		goto out_free_buf;
> +	}
> +
> +	ccmd = &xfer->cmds[0];
> +	ccmd->cmd1 = CMD1_FIFO_CCC(I3C_CCC_ENTHDR(0));
> +	ccmd->cmd0 = CMD0_FIFO_IS_CCC;
> +
> +	ccmd = &xfer->cmds[1];
> +
> +	if (cmdword & I3C_DDR_READ_CMD)
> +		cmdword = prepare_ddr_parity_bit(cmdword);
> +
> +	ccmd->tx_len = ntxwords * sizeof(u32);
> +	ccmd->tx_buf = buf;
> +	ccmd->rx_len = nrxwords * sizeof(u32);
> +	ccmd->rx_buf = buf + ntxwords;
> +
> +	buf[0] = prepare_ddr_cmd_word(cmdword);
> +	crc5 = update_crc5(0x1f, cmdword);
> +	for (i = 0; i < ntxwords - 2; i++) {
> +		crc5 = update_crc5(crc5, cmds[0].data.out[i]);
> +		buf[i + 1] = prepare_ddr_data_word(cmds[0].data.out[i], !i);
> +	}
> +
> +	if(!(cmdword & I3C_DDR_READ_CMD))
> +		buf[ntxwords-1] = prepare_ddr_crc_word(crc5);
> +
> +	ccmd->cmd0 = CMD0_FIFO_IS_DDR | CMD0_FIFO_PL_LEN(ntxwords);
> +
> +	cdns_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> +		cdns_i3c_master_unqueue_xfer(master, xfer);
> +
> +	ret = xfer->ret;
> +
> +	if (!xfer->ret && nrxwords) {
> +		for (i = 0; i < nrxwords - 1; i++) {
> +			word = (((u32 *)ccmd->rx_buf)[i] & GENMASK(19, 0));
> +			datain = (word >> 2) & GENMASK(15, 0);
> +			checkword = prepare_ddr_data_word(datain, !i);
> +
> +			if (checkword != word) {
> +				ret = -EIO;
> +				break;
> +			}
> +
> +			crc5 = update_crc5(crc5, datain);
> +			cmds[0].data.in[i] = datain;
> +		}
> +
> +		word = (((u32 *)ccmd->rx_buf)[i] & GENMASK(19, 9));
> +		datain = (word >> 2) & GENMASK(15, 0);
> +		checkword = prepare_ddr_crc_word(crc5);
> +
> +		if (checkword != word)
> +			ret = -EIO;
> +	}
> +
> +	cdns_i3c_master_free_xfer(xfer);
> +
> +out_free_buf:
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
>  static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  				     const struct i2c_msg *xfers, int nxfers)
>  {
> @@ -1714,6 +1904,7 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
>  	.supports_ccc_cmd = cdns_i3c_master_supports_ccc_cmd,
>  	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
>  	.priv_xfers = cdns_i3c_master_priv_xfers,
> +	.send_hdr_cmds = cdns_i3c_master_send_hdr_cmd,
>  	.i2c_xfers = cdns_i3c_master_i2c_xfers,
>  	.i2c_funcs = cdns_i3c_master_i2c_funcs,
>  	.enable_ibi = cdns_i3c_master_enable_ibi,


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
