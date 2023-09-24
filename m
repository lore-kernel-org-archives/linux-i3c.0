Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F270CE7A89
	for <linux-i3c@archiver.kernel.org>; Sun, 24 Sep 2023 03:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otq21vEqIojsE6dhAIRKC6CnTbizdSntcaZrcMN0hkU=; b=r+IXPScT+eE8J5
	GLQkQXowRfr3+AebBKhmme+wC0E0ImZZHTSf3LwFtn5EYUpUC2TT791ogZjtrCA3MvNm5R2bWjQTM
	T7NVaJJigi7GolK85Fm25sLLWVskPly/4O+9w9O1n/kR3bT4CSAnBa+ftqW0fHRzKV3pnxZ7ac3Fz
	jLv4AhqjQ2uczN08UidfThQx4Y7f9FbRo+J0Ymn9oQR91x3TwOy1gREo/MDOB59Tr05E5QD9wQpNy
	RReoinLBa5rYDVewNgAPrc1dqQEOeiJ0a9u3/HFDo8KwkwbDLIuKDerUovhStYpzG33QhZ2SEeUh+
	z7AXupA+g6xuEVZ9g+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkFQP-00BhNS-2C;
	Sun, 24 Sep 2023 03:04:49 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkFQM-00BhMl-2k
	for linux-i3c@lists.infradead.org;
	Sun, 24 Sep 2023 03:04:48 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57656330b80so2601894eaf.3
        for <linux-i3c@lists.infradead.org>; Sat, 23 Sep 2023 20:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695524680; x=1696129480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3sQ7m4xt0fK6eu4MW7lFXq5f5EhNnp1BBnPa+JfP91w=;
        b=ORGPSXZMrQ0GPlKXkWXSgYW1vAPws+uUUdjkcWjcoVdyjQkCytOepf4F7VuXNNgojz
         YGrEcKCeQyIQIZxAYahZ0VoY175O+v7UGKDT+TjvoHLpB34Z2N3kbuw3yjb9QUvqdmSw
         QMLWRYYdn9n6X8kxsZ+7Lj4uoZM0J7FEMIOQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695524680; x=1696129480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sQ7m4xt0fK6eu4MW7lFXq5f5EhNnp1BBnPa+JfP91w=;
        b=qCONObQ6jA2PB3x6KQ0FRwfjAkb/F8DCYw0QkShAKcNMFcFFKAxYGHjESqC1OZ2Ern
         bnnBsjCPfVt9GG/azkFVhLFqaADeyNYG6bioQMfJNu5UBWGPP2MyeG50BTZSRPMtdFpC
         9rzLZYVRiBYUl11no/hdq5kVZ5oSYM2mjHSJDUPjY7P2TRdLQ2w5dy5uKfSs8bgkFYRT
         xg+u4TuQlowIF9hbL3ftOiv1oSB5Nu3iKePCBhYmvMaiLsVHv5EI1qGAMjsR4Pz7iuKM
         vx75sULb4jpwnCSC/Ov8fpvuCw/m1gRauZUmixgKVAzjT5AvMC0nA8NG4HNQ7TU0cbkz
         d77Q==
X-Gm-Message-State: AOJu0YyC2TRMu06q/lFixED67EtTKc0f16H2O6aTbMWrhcCQqKWituMf
	IXRtEUO+OSovy89tu+ak3ybcAQ==
X-Google-Smtp-Source: AGHT+IEyctQpGdRHVqfskRrctSvr+c0AutzD5V01OHg/wphX4795l8UXDPxsR/JiCrGwUFsS6seQ2g==
X-Received: by 2002:a05:6358:991e:b0:141:d2d:6da7 with SMTP id w30-20020a056358991e00b001410d2d6da7mr4584544rwa.17.1695524680210;
        Sat, 23 Sep 2023 20:04:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0027480345180sm7265781pjb.2.2023.09.23.20.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 20:04:39 -0700 (PDT)
Date: Sat, 23 Sep 2023 20:04:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: replace deprecated strncpy
Message-ID: <202309232003.05306BB415@keescook>
References: <20230921-strncpy-drivers-i3c-master-c-v1-1-9fdb8d8169e1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921-strncpy-drivers-i3c-master-c-v1-1-9fdb8d8169e1@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_200446_895515_BFAB8431 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, Sep 21, 2023 at 03:51:04AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> We expect adap->name to be NUL-terminated based on i2c_adapter name use:
> | dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> 
> NUL-padding does not seem to be required as `master` is zero-allocated
> and `i3c_master_to_i2c_adapter` simply returns a field from within
> `master`:
> |       master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> ...
> |      	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
> ...
> |       static struct i2c_adapter *
> |       i3c_master_to_i2c_adapter(struct i3c_master_controller *master)
> |       {
> |       	return &master->i2c;
> |       }
> 
> This means that `adap->name` should already be filled with NUL-bytes.
> 
> Considering the above, a suitable replacement is `strscpy` [2] due to
> the fact that it guarantees NUL-termination on the destination buffer
> without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Looks right to me; straight replacement.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
