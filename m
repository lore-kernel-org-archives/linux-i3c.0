Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7059C77B60
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iMjDxGiZJedFIUY9FGcM3J5Ya/KDO/5tXxlVofKoBE=; b=nmsoSUgdElUHuC
	3udJ7aBXQRQByZ3vQ1IurXFW657xseaBifFOLHR9807OOclfw3fzHz9yy4+z6B0vi2LnL43h60zJz
	KEyemLWkCjlAP9ug7vLniEGDexYfFtEsleg/W/Nd1D8FWsjK/zclEvIU/5nlnUid6kuhYpRPtLH1J
	NFY9eSZa6xaQhrp9RTHHCqbTICuPX+P9qJGx4SGE4vYARanIwD8jv7HFyUzxEXMcinVmtU+ktjhAj
	OLNovSpJbj55wgeT3HgpLUCansAVqOjbM6hhFlNp9Ad0h4p8yuTCVFfr3ryQMZPo9gkUPBzxecTpm
	R1d1oDAVoq/obaSyeSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phxnd-004uNB-02;
	Thu, 30 Mar 2023 19:19:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phxna-004uMW-1h
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 19:19:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o32so11575993wms.1
        for <linux-i3c@lists.infradead.org>; Thu, 30 Mar 2023 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1680203940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2itnY4oDJ000Qz5ydKRWEvoea5AiqZAu0ly2xDDisE=;
        b=Z4CLw+kmjOxRlMPdzjkqrSlBDgPF/o8to2tkK4tEz0axz6sMkMH9fWtzQ5N4Ve76mO
         REZyMIpan/iyriYtd0yWjAs0NkawcSFObyow76QTZXiOb0ULvsU6bNpLyDLBRIuWyGP2
         YgTZ5Ll5wcUelLXgOPcUTBKOcDC9vNPFMGK50UjUu95C4s3HVd760lzuLGsgHX8J5OlW
         A6bpI7j3J1XcGu43dTOhVylIs0ET1Ag8UQaK5s0Av3SLvsQomC5c1rtVsG5J3kQUMEhD
         VL+K+ylsz1bLd5fxpTFeg24tp0KWryu/6rX+Uo9ZTQECWo3A3tyJt8YvDZELxHdWRXRr
         YmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680203940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2itnY4oDJ000Qz5ydKRWEvoea5AiqZAu0ly2xDDisE=;
        b=eLs5fvqCQJEStR2BuYigi6DXUBU6oE9Awz5CkjJjpQrX0MU66EiYGJtp+eA1sx+Zgc
         Waj0eFRUlPWLbhs/bR/S7OfYb9PU8m4ivF37wvIG0/i7owUZFiMFAhOMIzUh86DAbCGR
         f3snxTqeoDyaTtzT1FWSUy2fnF6BdgrVzA+h0lgmONhN/C9Y+HIP3zqUgm0VCsD8qea/
         MIpBdTOuRZ7lu1WCVbjF/rFPMc3hzyUrLchQzvmdlQbq6h4Nn9vUPKROiGfPZlxQN+L4
         MeYxFwNfkQe/v1ZrGl9u0RyRMWtbhYYejFHBhCHZ400fzDiIEydx2ZoRq0TRq/xXjXyZ
         sbjA==
X-Gm-Message-State: AAQBX9d34cSAZyXMvPonHfUQ1666lhi4eokpPBnTyDfvCxTw/fWyKulf
	Kh7SZi4mkHwUqzS17TUgfecVfg==
X-Google-Smtp-Source: AKy350Y6Hw2jwioyUDEOhgIMCrr8x2+0OYs7LIza9+xA94gZtR4ILuxSxXzmljBAbWAumyI5xeoZWw==
X-Received: by 2002:a1c:6a0b:0:b0:3db:8de:6993 with SMTP id f11-20020a1c6a0b000000b003db08de6993mr5204637wmc.4.1680203940339;
        Thu, 30 Mar 2023 12:19:00 -0700 (PDT)
Received: from [192.168.0.16] (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c228300b003ed2384566fsm157950wmf.21.2023.03.30.12.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 12:19:00 -0700 (PDT)
Message-ID: <1981d2b2-8082-ccba-5a41-7f2162410163@sifive.com>
Date: Thu, 30 Mar 2023 20:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] i3c: dw: Create a generic fifo read function
Content-Language: en-GB
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>, Vitor Soares
 <ivitro@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Chen <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
 <827204789583dd86addffb47ecaeab9d67cf95d5.1680161823.git.jk@codeconstruct.com.au>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <827204789583dd86addffb47ecaeab9d67cf95d5.1680161823.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_121902_630139_1C9CA531 
X-CRM114-Status: GOOD (  16.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 30/03/2023 08:50, Jeremy Kerr wrote:
> In a future change we'll want to read from the IBI FIFO too, so turn
> dw_i3c_read_rx_fifo() into a generic read with the FIFO register as a
> parameter.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9fc03108a5db..cb38ef95f21a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -318,18 +318,24 @@ static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
>   	}
>   }
>   
> -static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
> -				       u8 *bytes, int nbytes)
> +static void dw_i3c_master_read_fifo(struct dw_i3c_master *master,
> +				    int reg,  u8 *bytes, int nbytes)
>   {
> -	readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
> +	readsl(master->regs + reg, bytes, nbytes / 4);
>   	if (nbytes & 3) {
>   		u32 tmp;
>   
> -		readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
> +		readsl(master->regs + reg, &tmp, 1);
>   		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
>   	}
>   }
>   
> +static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
> +				       u8 *bytes, int nbytes)
> +{
> +	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
> +}
> +

Might want to make it inline too.


>   static struct dw_i3c_xfer *
>   dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
>   {


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
