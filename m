Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C3DC001DD
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pScc20z2LbLfdNbAAyRXGQEF9rZJHVgmW0WuF5/SRRA=; b=o8WMlB0ESM7+Tg
	P1Sb0HHZE4TbcpdQ3DfUnsfsU4QNyfuyqZ3DhtzwTeK0Ey/mqYpge2onfEISeWOCgm7uQh0A9A1zP
	bS4l/YG/eXyaerV9bhDHz6j/sRoI0HFiBA5YFdsBHerQm/hMq4+Nru1nTKLbAWKThhW7rh4Ruuw9j
	kxBuuckzXmtnQOr2CfutnDFoIeIksZDA1c0AEi4nvv2VWmGe8sLHLj+pQZjZLns1h26xfr3HzghbI
	k5hqsoCVf6WZ4ixmoC2eDMQktKhbc2Xc5CgDrFcjhPM65HR2VLAKiby2ham+CXaPv5JNy5Izhgkpz
	/ONvNbLnOjhLdpnQW4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQLK-00BPEf-2u;
	Mon, 03 Jul 2023 20:40:18 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9] helo=mail.monkeyblade.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGI3R-00APPJ-27
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 11:49:18 +0000
Received: from localhost (cpc147930-brnt3-2-0-cust60.4-2.cable.virginm.net [86.15.196.61])
	by mail.monkeyblade.net (Postfix) with ESMTPSA id 2589983844AA;
	Mon,  3 Jul 2023 04:49:07 -0700 (PDT)
Date: Mon, 03 Jul 2023 12:48:57 +0100 (BST)
Message-Id: <20230703.124857.1785883665481694727.davem@davemloft.net>
To: matt@codeconstruct.com.au
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jk@codeconstruct.com.au, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/3] mctp i3c: MCTP I3C driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <20230703053048.275709-4-matt@codeconstruct.com.au>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
	<20230703053048.275709-4-matt@codeconstruct.com.au>
X-Mailer: Mew version 6.9 on Emacs 28.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Mon, 03 Jul 2023 04:49:11 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_044917_716224_1AFB7B1B 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 03 Jul 2023 13:40:17 -0700
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

From: Matt Johnston <matt@codeconstruct.com.au>
Date: Mon,  3 Jul 2023 13:30:48 +0800

> +static void mctp_i3c_xmit(struct mctp_i3c_bus *mbus, struct sk_buff *skb)
> +{
> +	struct net_device_stats *stats = &mbus->ndev->stats;
> +	struct i3c_priv_xfer xfer = { .rnw = false };
> +	struct mctp_i3c_internal_hdr *ihdr = NULL;
> +	struct mctp_i3c_device *mi = NULL;
> +	u8 *data = NULL;
> +	unsigned int data_len;
> +	u8 addr, pec;
> +	int rc = 0;
> +	u64 pid;
 ...
> +/* Returns an ERR_PTR on failure */
> +static struct mctp_i3c_bus *mctp_i3c_bus_add(struct i3c_bus *bus)
> +__must_hold(&busdevs_lock)
> +{
> +	struct mctp_i3c_bus *mbus = NULL;
> +	struct net_device *ndev = NULL;
> +	u8 addr[PID_SIZE];
> +	char namebuf[IFNAMSIZ];
> +	int rc;


Please order local variables from longest to shortest line.

Please do this for your entire submission.

Thank you.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
