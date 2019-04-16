Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511D9C10F14
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 06:10:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC3220663
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 06:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKZ1taoQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC3220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYE+uWhgE4HLeafpe89WOL1g1YU0nrZE2EsuNa0pNOg=; b=OKZ1taoQgS4T7a
	rbDsuLjpb1krsaciVNBl1m4GN6h0YUqaTGTVfr04lVXNy/6X7H7FpLb7yYjI+LmukCdG4E36/Uxln
	ivlvplKlrDoWmS9FZhufEp2PKJLlIeMLAQ6d+OUImBUDFDFu1ypsv5wtAR2psE8DfcqmtPssKDq9I
	fjbvHfwJ3TrAbRZWpEIOm7azBHN5qYpDb9SaFUttA+YR+YUX/MasbF5y77ZxcZm/92PAiOVF3fu7j
	5uzi7KIUR6SK9mm081k7hHKJLnqNjTvogvZLSJe0qjAycpQAk8Azt8S0zSysTFNpC751maVuQCnET
	FXrRzpTRz80rbQjsYFAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGHIA-00075X-Ls; Tue, 16 Apr 2019 06:10:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGHI8-0006vZ-4g
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 06:10:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D235F260FF2;
 Tue, 16 Apr 2019 07:09:58 +0100 (BST)
Date: Tue, 16 Apr 2019 08:09:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH 3/3] i3c: dw: Add limited bus mode support
Message-ID: <20190416080956.10d89020@collabora.com>
In-Reply-To: <8cf1b180c31c5908d667285fa4880167a5e80c8c.1555350118.git.vitor.soares@synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <8cf1b180c31c5908d667285fa4880167a5e80c8c.1555350118.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_231000_313404_E5B927C5 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 Przemyslaw Gaj <pgaj@cadence.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

+Przemek

On Mon, 15 Apr 2019 20:46:43 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

> This patch add limited bus mode support for DesignWare i3c master
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <linux-kernel@vger.kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 0b01607..4005508 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -650,6 +650,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  
>  	switch (bus->mode) {
>  	case I3C_BUS_MODE_MIXED_FAST:
> +	case I3C_BUS_MODE_MIXED_LIMITED:
>  		ret = dw_i2c_clk_cfg(master);
>  		if (ret)
>  			return ret;

Przemek, you might want to do the same thing in the Cadence driver.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
