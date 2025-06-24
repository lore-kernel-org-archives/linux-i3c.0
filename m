Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2836BC77B7F
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8uff4QZWZh4pNuBeK5ClDUtRSBEgQBsVfisypNKaPg=; b=bqevBA6jvGtElI
	WsMBtGvaPn5tOYSQjTYgSEOYK8Je8y8Z6uvneNMtpn/ueUP6yVW7luyOcf9PeHoApLUUb4gm6bF0y
	4jPNTV5l0nRDDKQDPCLP8JvWFHJELvAO2MG5g9vjvaYCSSbNkIMNe1SmWxT/qZJOaptggM41GTmMP
	OLpGSwZ/ZaZVu11vauYQTToMPiVYfZ9x/eM8DUwfb2aO3+cawo7iOm3CeZK5gA2hq3qB4Pul8Nq/+
	sTESQVY4p9Vm9p73EuTQjXlGp35n7PO3yN1ktGMUvhSKCpqzfVHlThCwGKx7ScmXCnRHJTW3D6mm+
	V8SW1a8j40k6imbEGsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzaK-000000057Qn-3ln2;
	Tue, 24 Jun 2025 09:04:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzRO-0000000566H-29CL
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 08:55:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45377776935so16045525e9.3
        for <linux-i3c@lists.infradead.org>; Tue, 24 Jun 2025 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755341; x=1751360141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPGm+ksyyEeqsaZkk6KIgowMLGKZ7TrwFEqIL98DU2A=;
        b=bX4fHB56CyLIEOgAhiZYmpW8glFMLNNNkQtjJz3sPdC5qNQv5yhA8/BPKHKoOtUcUb
         l2BHvqaK7pIfiEW3EtP8pUXW8HurvMEkvZugJvfVUan6Kj7FWDwsacnxOEPm1J2h0/Yo
         pHhF6ckK2S0ohk3Ulo6pouFx9lL4uI1hBrG5wyd0HdGZsFlFYYhv9sNOMbdrh2+CebQb
         TwLzrcsNphGiR6v+0PuM3LajjMVkKQePbMNNU11Lpy4utlbEmTCRBVqzZBZf9EVzgJwV
         KgrQDhnO+Rb+REOEgKG19yxpRrSuD3PaqTU8o9BXtKgKWIestMCQIaEGNNiotv6M+GPN
         vMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755341; x=1751360141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPGm+ksyyEeqsaZkk6KIgowMLGKZ7TrwFEqIL98DU2A=;
        b=emkhKKPHSFD08EBM/gSCiETn2zTdCLcE9lsBSCkXfz9TvsnaLWGJo0V9QcyrKR5vHp
         N0+HZBnhW6JYls3/ty5EBVEHG8hxetzzkX5YfMDaFU8lqqDuIgK9PKprBJIp64XY8su2
         7R73QdQHXrD+HGfL2TRNYvRGbrFqXHzndBk8yuIQKmCSwDD3HqaEU70xw6wFOti8Tzca
         NfjWXReDJR2xjnWqOSnqQ4NTANz9RrXxBzGIMQWX5u+CFpkjIQpL3L8CxPzcak6YvQSn
         6xEJYUz28Jtf77jayQg94op9ENUdQEAK8Apcydi5Ctpsxd/qKwboJYIKy8D/XRUCyxpZ
         XO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU228Mxu5YI5PKBqopdFd4+HlbfgQDG/kYo9jpW4+PAT0a378DiMav61Xflif8529m73cbNOD6zsEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwonHxzT6XygyXzJ7Hff/JdCFpvB6ep6FI0GWbN0IdKYx9FKqdY
	ol+9JYNV8rMVBP6dTmxtnYAd15xDR7eIZLTL2TlnUTHuTi2zs6mJ7drl
X-Gm-Gg: ASbGnctmdKLCq1+62jXVV6mTQ1NAOr0xFdjOxcABMeM9VxUkikYLobu6znejq4OZc4d
	5/SqldAbWiFW4JIQQD9/h6dpHUlQzaD646/V2HA4vHCMUkOxCNODWm11n1TMwi1DzU2qNa3e4ow
	Sx+GAoHghdMKTMC5aJpLz9ZnSHunqXocR7D3XIqM3JG1kSEvGxM7rn9ROdFIwrivDeQ5TSjjYqi
	S9mhtmIcs4jKoeLu1dQ3fFm98boqOFNTkdHpEgYijpTu8HqjKC4yjS6WD+SpIhQpD0LwdxjZs7V
	fxUnijAkIIPfG4XJAsdbMow8HgufI2xOj0J+YJCUGVdYPc1iCZ3COhLWy4O5Ey+16ezcBegcUOj
	I4jpybDI=
X-Google-Smtp-Source: AGHT+IFi/6S11Ns8YaVWTB7lAOqARcQT5hiRsABwqS8+fvcL2CzddPVFXXjj9JPj4DA/1iVPexHNew==
X-Received: by 2002:a05:600c:1c98:b0:450:cf00:20f5 with SMTP id 5b1f17b1804b1-45367067893mr164029145e9.9.1750755340683;
        Tue, 24 Jun 2025 01:55:40 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm167215095e9.3.2025.06.24.01.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:55:40 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:55:37 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: cdns: Use i3c_master_writesl() and
 i3c_master_readsl()
Message-ID: <lzpi6excrkarkya7w2tgirxzpktrt67csg3pkquyw5er5w65au@ymh5kanqbaa4>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
 <aFl2j4BvOxzl/2nh@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFl2j4BvOxzl/2nh@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_015542_558953_8E509229 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Jun 23, 2025 at 11:45:19AM -0400, Frank Li wrote:
> On Sun, Jun 22, 2025 at 11:18:59AM +0200, Jorge Marques wrote:
> > Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
> 
> API name changed, you need update it also, include subject.
> 
> Frank
> 
Ack

Regards,
Jorge
> > simplify code since the FIFO of controller is a 32bit width.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  drivers/i3c/master/i3c-master-cdns.c | 25 +++++--------------------
> >  1 file changed, 5 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> > index fd3752cea654954ed1e37337754e45fddbbbf68e..321c04d2109ec1951f2b07a9d1b88c6aaf055c95 100644
> > --- a/drivers/i3c/master/i3c-master-cdns.c
> > +++ b/drivers/i3c/master/i3c-master-cdns.c
> > @@ -23,6 +23,8 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/workqueue.h>
> >
> > +#include "../internals.h"
> > +
> >  #define DEV_ID				0x0
> >  #define DEV_ID_I3C_MASTER		0x5034
> >
> > @@ -427,25 +429,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
> >  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
> >  					  const u8 *bytes, int nbytes)
> >  {
> > -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> > -	if (nbytes & 3) {
> > -		u32 tmp = 0;
> > -
> > -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> > -		writesl(master->regs + TX_FIFO, &tmp, 1);
> > -	}
> > +	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
> >  }
> >
> >  static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
> >  					    u8 *bytes, int nbytes)
> >  {
> > -	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
> > -	if (nbytes & 3) {
> > -		u32 tmp;
> > -
> > -		readsl(master->regs + RX_FIFO, &tmp, 1);
> > -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > -	}
> > +	i3c_readl_fifo(master->regs + RX_FIFO, bytes, nbytes);
> >  }
> >
> >  static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> > @@ -1330,12 +1320,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
> >  	buf = slot->data;
> >
> >  	nbytes = IBIR_XFER_BYTES(ibir);
> > -	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
> > -	if (nbytes % 3) {
> > -		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
> > -
> > -		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> > -	}
> > +	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
> >
> >  	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
> >  			  dev->ibi->max_payload_len);
> >
> > --
> > 2.49.0
> >
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
