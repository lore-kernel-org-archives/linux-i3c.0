Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9300DCA9ED0
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Oct 2026 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaURabQmQUMs5VkDomwcGQ/Xb+AOJBY4Ly1VVKZwCtA=; b=ZyxXJYr2qrqBIr
	BWXlCaLVvI2xydRWEdpBmW4gk8H8KruIspLQBDzJoBrrvuKshgKzEbB+/y8qenNwO1by0laexipen
	A9to6fykn1APGiPK+ILeReV1UmkCfDEDe9kUE9K5QguoqFtPWwd0LXUn0VB69Eax/iUUp3sZUanCO
	1WxUl657hEujT9hu2BYWqopdG5x30//UQJRsJyEdg5sB9KGEblEsjTHu9Pds9SzfS4bWDERGImQel
	TBrhvPJPDUMJMMQ7TTQwT9wLNzhKXkq/jZlzsqt5JDJKpXMyLdi1FdAJMcmoTgrJwbazuwTQ+rOwR
	om6us9/xx0LIcQXIJ32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGO6w-0000000Bb6g-3Xkc;
	Mon, 12 Oct 2026 22:03:10 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGO6u-0000000Bb6N-0cWv
	for linux-i3c@lists.infradead.org;
	Mon, 12 Oct 2026 22:03:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b0703011c2so16680657b3.2
        for <linux-i3c@lists.infradead.org>; Mon, 12 Oct 2026 15:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842587; cv=none;
        d=google.com; s=arc-20260327;
        b=LAWqdwcFYwBDV23WvYJe+IwmQbt6DOgvy5maDH2auUQPzTMPPG9Nipf1IHKYRn90kF
         SuDhyLX8AXjBKQMb5sMvsgST0KlTtXba1okwrTTftxj9QiiFlWqv//TMqdGFQuBvcARI
         2+0kZfAgySqx5/amLvr9O78/QapLTWQ4jw42rP2goBGrkOFrNR8pbAn05+vTzXV+mnEm
         LcVQiq4BAoJEHiiWIb+smu/Cs76325NJdLM17xvC2s9p2Jxru1SnbrBLzgTHvqRoqNqe
         nq3D/QBHv3CKccHEjKQFffpSz8VJUAT31/Mr8zXYu5lcYsJmZLo4M/KSLcApc+q31meO
         7kNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        fh=YCGhyQg4qFhP3hveCMRc8rl8vylMJiw9v1MDLLOWzYo=;
        b=ZrPWsanzv/XtrjCERYp4G1UBSx0ozXX95bFXLiPoV2K1jc1CnVXyLl7aUbItKJdVFE
         DBnQ7Sw/1uhAe9pdevTHMtup+4+6TudDcjiscG+7vdxrl1r6RAsGKJthOY2XK0RxW+xK
         aKqtYNlyOIAS1suSHBqv1tLgNTJKQN5ip1gPTi+o8tMN2VfT2C+q9SyvxwywMaVyv0En
         vC1yBPbmD3farneFt4um+qoggUiQxOcX3olcKmfl8DDKJL9urP53EmZCfgXCiQQuJ520
         8GLyIPopojZKqEYSGB7k9l2yp6GlN4AINjkzXwV9RXCX04ATz7TwDIQAv1HpO3Oyah/a
         fu8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842587; x=1792447387; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        b=clLHbTuHpPyYjbkEuTdWgUgnjTmxWF0dC19bIPRxHosQH/eTa8ptJBS495aVl/n2f3
         OE9b1Xc2qOs5X8bwhR2ojZrP4BuUmFcbIeCNv7LbJ2cd3t+sCx0dTw50AC2N/EXc6/7U
         LdLb5LCwQHa9DR3ac99zqKJQCDXvNmmdPxUcm4taqe+plJgnngPpVBkAF9vNTCeSuolN
         WI3jcCsqhKeVz4+bVkHe67OFH8GXFVS3v7oLcpeypDXs2IgXN2UpwNbMdYfgUmRmdoHD
         rOcCwKp0oSr2Vr2jzVF/y+Jt2XcIxvDnfwfU30F0xlZLqaEji1k4VsbL7ruuHCl3ERGp
         UgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842587; x=1792447387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vzyboqz3gdzKLZQtJtdBkHZxkGcpVNHjaJ87oe6XI4I=;
        b=C949UY6Po22BnDe143gQSKQH6fTgvDF8rdOZoFwQrcgKQ7CzL+3/3h5XKQaSsnz5ez
         ulX7gytgIKPasxoclgF50Ki+eF4LTmKSDqPBTjNIzDtUO2vTUG0MyyCJvmBqAV06Q85j
         YvNrchAwNMeCqZOIYRTkeBC/FGVWOcRIQNEJAPobLxuxupsNTEASjFqwEZD4I0X9rLsD
         vmNgJLWH1tOg8JwwBsqS6c59919EZbA/dl5adKZh3UAfMyQVJ5eqwiz0Yr1UnhtAZhtC
         wxnzrnFYmdbMqAlzsNrx/IqeFtASXNDefbZu/jDIDrDCaRO8DIf9Q/rho/lbxcTkyIY2
         a/og==
X-Gm-Message-State: AFq9FYJxRd8XRfvNLNka/7l8DsMDCWecBZlVy4p96ld+ywNI60Pp8jj1
	FMWckcT33oDvKYSobh/cq0uqLjqe9ef9kiXK2gqASeO+cu96Ql1NDzu/dKlQ6zapgBx8cTV63/U
	EHV+EohTO/3odqGADDico6+aYT4FQ2WAdjF2qo+ZrTEEx/w3f6N1PRkTYRaVuYA==
X-Gm-Gg: AYBFou1tEiRtdtiNado0Bcf8us+fnaAsKBX/dbGTvEDhnRJY+/iWu5vFtlcdvMK/KK/
	eBmbNgooaxdYbPYtgr8gtSX4bgOZ2byqE/3/nFXsOuj1xTVxYPR4BrRWrlm7nj8E0/CmnMIP34H
	4pBz5Ss3z7B/69rrtd9aj8M3SH5IFm8Ytp/8/MuyNchgXaVd9NVneU3Ij5cQ3tl96eQoRQtwgpG
	a4fdxMJa5mxGoteTFFh0XqJE09wCFP5TqYfyGmawBrXoy4D8SAuFnsWd5IzRkcwpRk6xhspp44A
	OHq/VNtVziLuPJKSXFeZ1gln2WuMrpizV0uzOLGV295FWQX62Hj0N4K7xN4vF6wREmzaQnBNRUW
	iWAKSxP7SgTk7v59eAM/1
X-Received: by 2002:a05:690c:38a:b0:8a9:4dfa:491b with SMTP id
 00721157ae682-8b07edbf34emr30660547b3.21.1791842586148; Mon, 12 Oct 2026
 15:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-5-samagazaryan@google.com> <araVh6bbUTGcOf0a@lizhi-Precision-Tower-5810>
In-Reply-To: <araVh6bbUTGcOf0a@lizhi-Precision-Tower-5810>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 12 Oct 2026 15:02:55 -0700
X-Gm-Features: AclHuK-4LYE2f0BdadiEK8K0xDLDyM1BsWxpVUWgmwiScvTkyVvHA5N3qTqlemc
Message-ID: <CAHreonGqzUjXGhotEia=k8pQtGodfOH0jiPpVZ-5Nsf=RDzh5g@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_150308_218204_984A011D 
X-CRM114-Status: UNSURE (   6.85  )
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

>
> cleanup.h prefer declear tmp here
>
>         char *tmp __free(kfree) = kzalloc(count, GFP_KERNEL);
>
> check others
>

Declared all __free(kfree) vars inline when they are allocated
(i3cdev_read(), i3cdev_write(), i3cdev_do_xfer(), i3cdev_ioc_xfer())

> Can we share the above information include MODE* with i3c system to avoid
> duplicate it?
>


For v6 the i3c_xfer_mode enum will live in include/uapi/linux/i3c/i3cdev.h and
be included by include/linux/i3c/device.h.

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
