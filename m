Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D55C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RL5y8gNzwRq/cS27rAYmEN6ddlWmBEmHUauAw422BjE=; b=jF/Yqt4NA2BN0k
	MqNr+FM8DIbbspdNp/WH2zwrRczCaTGY7vXcThDEsU3bJCmQxt/ndTUquguw7djuTmIEpUBOGnIMn
	zRYonw2/qTTKC1c43yUGBICe68LuBzG3k0zSYCeInwI/YTmaQP88gACyWxc9alx8qPHKAJO2sw/i+
	3bQKmAIs2OFPOz13VY08LzgEjfxyKsmIko0luTjj8f400s5Cfb4L88o8uRpFVx3kDKd16MPd+4JDY
	Aig/bxGisOkB3PZ90EILHpu4GWVCK8BaqFfSSSXBmJWPjFtF2q3itjE0r8m44eQ441zrTmv4alqOG
	SbEqGIDyrXgXCAaVbEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEGJ-00000008vpM-37U1;
	Mon, 13 Jul 2026 10:51:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEGH-00000008vne-1a1o
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 10:51:46 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-caf45fc5202so712187a12.1
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 03:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783939902; cv=none;
        d=google.com; s=arc-20260327;
        b=Ycsz3dS06H+fIacQr07JmuZp9zlq0868icS3N+Qf4lHtq+HBMfPFy+icJNkFanuKf1
         eIHmtyjaDfYrgnOIaW0JKPLhI/TycadlYVFe2w6J2EAp4/ZIvLGCJ7wCxpis/GkZGSZd
         /bi11ybW4vDAslPzxHbbJGsHSdQhXOH/vZFgtC22QoGIaNR/98O0rSYRnBSnymGqTXY/
         GwCyZD597wqwQ0B2R7/8+eIuK5Wtw7Q2FoWoVwwZz++7/lhI2Joj/D/rarSPH5264kwL
         HFn9mEKg8VpKmM6sYcjRSdgReCxBCIfST/8tnDQ1KkLsnkdshhm0X+8NFdzzDEegf7B8
         pm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FNf92TyZVyw4x5cNjSKuqjpK286i5rfLYFZYMpGInXU=;
        fh=tJufgPkFjmnq5yNKPy9X8F8NinpSECq0CyhSdroVM3o=;
        b=GwJG93MllnIn/29Ql1sXOuHJfaiVaGuNYxQVWBT63YBT6WXownsGFBdn9px4n9Qnys
         b0w8/e/Fs/EVaLLXBk2xzH6mI21ekCwZ4AOx96R0hcquICUBOhQ8a5FEB9oWDmg4dPFl
         UZ5lvws6rUyVP4yvN7jaXA1eXpZMQWbvtga76gSqfxEziNSd1DDTX85L1Wd3VVSMIvKD
         pxEdUi0BjDRQ0D7pS/SzK/TNz59AZMF46AxhavNDgbOdTHFDWA9vsy6xjO1Y5L3l2lMo
         A+wVk9Ng9DKkcHebWrnkgWHbbwCodVq1ztlHDIb7qSHY2pNzrLcxl8JKGBhEl5qltXoO
         hO7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783939902; x=1784544702; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNf92TyZVyw4x5cNjSKuqjpK286i5rfLYFZYMpGInXU=;
        b=ss64CdOF9FL2CTQz4w6QOiOTm4DmvFe4GOpu0q5Q+r3UizWiaZHLlELxdzsvJ16RZn
         AW3hHdXLj+/77n4+N/kVSLQH1xqCo9ztKevw4k36ABe8oK9p+248j7pMQOxKD2A0pewx
         YHz/BUNXpuD4mtuVZtBBw2nlJATJIcJC8ZYvwm8aV+fKNLJc3Pyn52oVszi8E3fFTiQ8
         jqUDv5eaPXM3MC0g1Z82c+RtQGtiayVSsuvyYyHL0pKgCznBOqLIV446QewKPg9iAadZ
         zN2XAvgTllMexTwflIbwPwlGCNEywjgdEL6RVT7CIQVumK9GAb2qqomUauXcPn5MSeTE
         eN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939902; x=1784544702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNf92TyZVyw4x5cNjSKuqjpK286i5rfLYFZYMpGInXU=;
        b=QYwnZnW/PVi+eVzbI4ecwyaxfVW5h9KxS5mcD7jgjMI2p5gVRPpmVqHHxVDGn5mTs6
         S2y6VCOr2fzs0UCbcsfsPWL6ZgtQU1Z0FP00pRSnqWCkAmeoCxXffIBiE1YMUAZDTHxs
         kFfXFby6ZeoEmExwGMptFDLdp4UayQ1Loescfxag4gE0o5CFJv0aMMn6HFq4df10QHpU
         REOCxT63V6bm5euVMpgymPmLIkMKdz+Y183EppjUAi6BDOe3BeSrq8LnZfhgUXJoISOD
         Cv5SHt4KS+fBtXRShJVktMXf8PvrBDgG1g+y8g6XwjSYC3CMZvslLTFFauDBbWprjXyM
         cACQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFXUGM8vz7XQsLLpuaDt3hLY/Vi4DX5Vqg2AA8l8jaVfJfhtZ4UTZL+URjDUUuOLbQhbm8FlKfDSE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0oeMi5Pb5agkbMkOpZ/spyZsA39sL7T5hgBKVseAhnWEwWI/Z
	daYcEK1X0uRb5PepL9k6GlKogNZ1xhEu0WnmSAWtDs9chNHSQ6Tmx47mVyaNRR3hpGhyn5/FTOx
	plH0pMGIrGqfKUAA6IEKPBHpIJ3pIa1alODHC71M=
X-Gm-Gg: AfdE7ckdKhShvYsnK7NeQTfeRzaX1MtqcPWMJb1v4/nxNIg3nsv7tNJHehpJtyVWdr5
	LY0MTU9FPL6MrCfLOyVQHCIuxMf0KBcz6eyZr4k2X3ECl1QyZmUY/6o+dLuDj+S+U0bRnDlyLia
	ozTCODz+JdPyXKHzvJUe/qTBwoy08TYcjW6ZfPr2CzzWCbghDTncv1voiq/eBQJNDola+UfbueM
	9pYvnJIrSTuYq9mrWOxQdGg52Op5TrNUW0ciGBrbe3Ygi3DmpwGjSKYVfqsdDAkEnh0Otfx4xPU
	rvINHtxu
X-Received: by 2002:a05:6a21:a341:b0:3c0:9c18:d5a8 with SMTP id
 adf61e73a8af0-3c111079720mr8556131637.69.1783939901696; Mon, 13 Jul 2026
 03:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260709071744.333403-2-Jm_Liao@asmedia.com.tw> <ak_slNTM4Y8ed7RN@lizhi-Precision-Tower-5810>
In-Reply-To: <ak_slNTM4Y8ed7RN@lizhi-Precision-Tower-5810>
From: =?UTF-8?B?5buW5bu66YqY?= <tim678910@gmail.com>
Date: Mon, 13 Jul 2026 18:51:30 +0800
X-Gm-Features: AUfX_mzrJlrrBxrrO-QSeYBhBhgKBArxsWuce7zw3kP9xOzkYx3BU0dEBKFK_AU
Message-ID: <CAGfoLndaWX4gov8YdCd=Z4F5vKBRoLZQk=K7XBirUXbTf8jdYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Enable IBI threshold interrupt by
 default in PIO mode
To: Frank Li <Frank.li@oss.nxp.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, adrian.hunter@intel.com, 
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	Jm_Liao@asmedia.com.tw, Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw, 
	Patrick_Yen@asmedia.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_035145_449152_5E9343B7 
X-CRM114-Status: GOOD (  14.40  )
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

On Fri, Jul 10, 2026 at 02:46:00AM +0000, Frank Li wrote:
>
> On Thu, Jul 09, 2026 at 03:17:42PM +0800, Jian-Ming Liao wrote:
> > Enable the IBI threshold interrupt (STAT_IBI_STATUS_THLD) by default
> > during PIO initialization. This ensures that Hot-Join requests and
> > early IBIs from devices that have not yet formally requested routing
>
> Do you means not call i3c_device_request_ibi()?
>
> Frank

Hi Frank,

Thank you for the feedback.

To provide more context, i3c_device_request_ibi() is indeed being called.
However, according to the HCI spec, if the driver needs to receive interrupts
from the IBI, the STAT_IBI_STATUS_THLD bit in PIO_INTR_SIGNAL_ENABLE must be
set. I noticed that the current driver implementation does not handle this
flag, not even in i3c_device_request_ibi().

Would you recommend handling this in hci_pio_request_ibi() to ensure it's
only enabled when requested? Or is there a preferred way in the I3C framework
to implement this kind of configuration?

I would appreciate your guidance on the best approach to handle this
without compromising the common code path.

Best regards,
Jian-Ming Liao

> > are properly captured, improving system responsiveness and stability.

> > -     pio->enabled_irqs = STAT_ALL_ERRORS;
> > +     pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
