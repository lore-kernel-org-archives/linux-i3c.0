Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9538F106705C
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHTYA6MHF9yB7P281BX89FXmqsugyJeK5lnDJ64fBtM=; b=ncsmocMJgQiGKU
	PSHsqslf3DvhytRM1kRLd2n8nsbgnpVKfGK5XtPXgCchnX67N+czVl42Rr0A6zFIeKIYP6KAYA1VX
	Hhp04PqcA0/ZdSUUuxXMTgbOVlsKNnBYVjS23jCiSZY2QbqwPgZUecycatunBMCYNRKxcMaebmCs8
	FqlPZStgeqSMgCmiuBPWvAB6EptWKtHBHC3CBZq0QQewa5eZiS+/kIt9dA5/220gfqzSy+cTszY9W
	dRrXPimWx9guu6eMPFlqvsapSh3p9sSqNGTV06OXLuxlpcnoV/J2KRA7DSkpXW9cROel+xBtbVJbc
	pAiWhBbGuEGu312n8V9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iJ3-0000000ERid-1JnZ;
	Thu, 12 Mar 2026 15:50:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIr-0000000ERbB-1pWd
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so10651485e9.1
        for <linux-i3c@lists.infradead.org>; Thu, 12 Mar 2026 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330621; x=1773935421; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSKbxEeEJifYX6N6G0Cg9sxTP6bHEtUmtmLlAvKKuh0=;
        b=hCFn20OqxMMM0xBcGHcYQhPVkDGShXt7LrTHtXS8sdcPbyWBPlidxJF+1lyJG5+90n
         ZOnux6OyweQgvh/CXy6bkDwL6gJQiklNGvDa3JJNfxQJ22qWHQX7964qIDR4HzNdOiGO
         glzYyBQNURIlhm2tthHp7nKjOJqL9G5+vHJeNN9hZJnKwPGwa7xCXtH3v1/UMlZJmGKk
         7xP07chRe1o4rHIkcV0crj+f4wSOfKNulYTRdZUyNhIFBI9mA5KS4UqG9p50gEBL2uVA
         x32M6mwX6mPLeold9kpIrblTaUaqgV856ut0fy7NxvIMZ4/nVetFWuHoQCJLKeeig7zh
         OfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330621; x=1773935421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSKbxEeEJifYX6N6G0Cg9sxTP6bHEtUmtmLlAvKKuh0=;
        b=jf8At4upBmgyNEhlKLuhQEajpb3+htNx3WvCsp9rRrEJpLCOMGjlrSoiGMQ1m6TOLj
         qn4brSfpVXJSkQgwZSfR3yqCu09nNZb58dkGJlImmhavrdKMePAhfHlB/RaOp2vqRPLY
         WjAk8vltwUUCsUT2Yi8mBXNwD6S/aUfNe9k1JyWrVwWc9zBt1fMw06vfWHnHqP62cWpP
         Vbw6TL2iYao5NleHNiwx4D9z8kNQeBG/z5/iB6rPOPg/ISt2J2Ab5hD63E63ImxzBOal
         NR54VqtYYiI45xt3Ic6Qu89eX5GWrfm1rO55cAMBZuew7WnfJfE9MUpOwAl8n3CbNbwf
         sXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4sjgM2suO3v6iN/v/fifIwYYY4aYf9G+08s908lTW3vNs/qKfN/FjGzL4aOO3ReFEiSy2sOIvJOY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cwHbVojHPLOT7hY1jlMvzxSDb9J+SbT/iGivMQXmVQrWmfIp
	rNxf/jSQIQEkqNP68V3DzGRQPJyImmc5aZO+he9dnDoPsq4PJMLn/JBh
X-Gm-Gg: ATEYQzyyb8pXidFA43MaFsJTYjqDAVtdt7wlJfsuF00L8jzkAOSNBQ3Y4BU52sxc0NB
	dBlIPipcY3hZ1l5mvfXQ/rwSzChpIzc6aIDgZ+pKBDpSm7BKZQJ2oygyB5ImGAiFsfBovRGgKVz
	Wse5d/vour4qYg5JXuStnmbete7tTAGAuDMRYh+VlPkWNdtfwidF5c5VFWf6XAdVjKy8zOMWGqj
	ln36PCLzFTOHVKEU6XSazmpyE4H1yoTcn7/fLSB/p8GNwn4vTNd4X2+gWV8Q074Ex8TnUqfIxWa
	WQ80fGkBOEGi0D1xCHJCBxRBmoG/CZTc4fKJd+a4A9zvq7nxShG6cYXbMTfh/QrS/qkVlwnzuyG
	hBHNav6JcjBLWr//Siko0AP58of2XYTzmkJ42nL+BMuozAyGLNMTfLMWXR8pPrOCsoeoqXUUmW6
	2GaDX82xiJLW8Y2w67uNjnATcjVhJfH9SMWP8va0Vo8N42snVWWxvKAKBTSzMQnvbCWySOjC7o4
	Rti9XYEPa5Ef6JPpHl3fiqR7NMxkdWHVtzXgtAJFzGCAa8OFtKwXbeNkRqByyu2
X-Received: by 2002:a05:600c:3490:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-4854b13e2c7mr106560345e9.33.1773330621311;
        Thu, 12 Mar 2026 08:50:21 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419c2930sm395542235e9.0.2026.03.12.08.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:20 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:50:18 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 5/5] i3c: master: adi: Return xfer->ret at send CCC
Message-ID: <kujqru4xwhg2pcboxnfnd43zkn7e4julvxs3yzwhkc534zbzp6@ihagcsryb3ig>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-5-72d3c5290b4a@analog.com>
 <4c9037bc-52ee-466a-83e4-113496cad016@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c9037bc-52ee-466a-83e4-113496cad016@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085025_491741_5B7DA665 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Mar 10, 2026 at 09:15:25PM +0200, Adrian Hunter wrote:
> On 08/03/2026 18:47, Jorge Marques wrote:
> > Return the xfer-> ret error code at adi_i3c_master_send_ccc_cmd to
> > propagate the adi_i3c_master_end_xfer_locked value. In particular, if
> > any of the Mx values are present in the sent commands, returns -EIO.
> 
> Isn't this also a bug fix.   I suggest a fixes tag and
> better commit message e.g.
> 
>   i3c: master: adi: Fix missing error propagation for CCC commands
> 
>   adi_i3c_master_send_ccc_cmd() always returned 0, ignoring the transfer
>   result populated in the completion path. As a consequence, CCC command
>   errors - such as those reported by adi_i3c_master_end_xfer_locked() - were
>   silently dropped.
> 
>   Fix this by returning xfer->ret so that callers correctly receive any
>   transfer error codes.
> 
> By the way, I don't see an error code being set in the timeout case?
> 
Hi Adrian, when the xfer is allocated, the default xfer->ret value is
set to -ETIMEDOUT, so un-queuing retains this value and is (with this
patch) returned.

Regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
