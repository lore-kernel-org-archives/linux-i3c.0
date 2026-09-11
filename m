Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9A2C88E50
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 23:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmhvU77sMIEIbsq4JkaU6Qz+Nha+I3DChtwg84v5Uyw=; b=4PcjVmLbMYXKk2
	J9U8gsI+Q3RqpB8anLadN3PbMu/JHZNjBqUxp1eqOXho+6LdVOzy0wk5PmzW5IHjvdeKsrxgss0Bw
	26w+QwKEVxhKxvnV282/VO7jeoDox2/Zz2RzIpucUYpnsvG6hVuh3tcc8/7Z4aGvGaptyQ6mC2txc
	9DMKyASa/ETFFj+I7L+RIAqEjc6lgWDC1pAvSzxTCBHFDbOOj1QTuK4Pr9USiDemh2zxxulCAgI+m
	S8e6PqbOMuSxiheYN7qIgh4iVyn2Xuswas8cmrs5tXHwD0FhuVmyYtwEp/LQZ7NQhBRhz3v3Nxpmk
	zADO1saosX5zwoIC8bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5B7q-00000000PFa-0yBr;
	Fri, 11 Sep 2026 23:57:46 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5B7o-00000000PFH-0jx7
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 23:57:45 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43db0c16so1161417b3.1
        for <linux-i3c@lists.infradead.org>; Fri, 11 Sep 2026 16:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789171062; cv=none;
        d=google.com; s=arc-20260327;
        b=R8J6N5OBFw1wWImowOjyYQyyPnV8ymycfIznmQHkrfWeFLpALN7XfrNbZ4Hx974Z80
         CeN2MFm3ZbCQJTXnXF1ndXH9OcrBobr+GDWgZMZQeILKI470YE3lAFHRCufX3fVIrXw7
         6/g8pvsyi76miWuRTDpSN8IATLli5IHNvbLpIkPrJqKDYxv3VcAi30oxeOCOqx7RphNh
         C6WcjjM5i1t/EWSUH7r+EGVFDpQ55SFaFlz2GmGiFfUVpWYhMKDRi4sV/ENOxql1Kkri
         PQ4+DXkXK6jXk/yTKdnr112o4W0Sj9pLHOoRQQbLd4ThKMb+4mAOLgKhNLFBwLIUrU8s
         JIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        fh=U/ZmURP1WhCNPRSyIWzrUaTM97yhfkNob/TLz4j6RcE=;
        b=jSHi8HDb24WyteGr3GQqDWkBE52Rv5Ku5s4/qFHek64tgyrqiTSM7PsMSqZ4cH022d
         fVKS/+yl1ZCn6NMUnHX6iFF9PwFCsql+ww8n079p92bGu4gBaAf7LmD3RTGqNHsEnltT
         C1VkKn3fTG04pIZlzYMpJLB5epmkTdN7dMj42Ve1MzRr1ycAOtLebDX2urGTD8VwWiEJ
         NCUCj551d8P1MT4T3s2RR5toLuYF4VCLA2S01wyVMxfMFW/drZfp3pyBSN9gqKy5q4p3
         u6y/dKBz+tGsSKtOXWEKSfmq5iJN6knRWViwFdQkP3uaYYiZmoeAN0LXO+NxMdDAhHpp
         QbEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789171062; x=1789775862; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        b=tZ6MPDaIHyTyKQQavQSogmH8twgKRWMvt6/Ozd8639AvepkW3JoFlPPfsZYjJHnMcR
         +l/53iIhbWB0d3ZLByF17Pp8pRFRczwQksJlx5/CtRaf9t0cSwQ4LxJFWM3uI65pqThI
         aIyxUIrLF4EiyZEnXkEM+FHzpFzz8ZYaaPA2LWrMbnY7kJ2Y44Glsr8wUBIU3T19Oh70
         586XWX2zAzJY/chDt4lgflp1200FP6ML9m0pGXBFFyH3zl3zQ4Re71QHDBh2mUL9JY0N
         p+1MS3hHBjRGunhCuZ9R4+l3czos7eYnMEHJ8CLtucB7Y5Uri4Xlt8lZeM2Ai/JTf+pf
         x/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171062; x=1789775862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQq2pAxxltC3cCwqlUs0gtYpd6fcKoy7z/dHR1GPO7Q=;
        b=NfJ24x+h8R2IVNJA5OqnNgaPv+nVrLkLgMB+3lgOiHh3HTokpOJgwYFdJkiVj6lU4T
         lswQ/USPzQ0cgrUj5Cd233q4TyWCrSOCTY3C3JZ5mxd8stlepcUOzYXnYHQRVlVrsVYb
         XrhuoR8QxUMpPIGOWZXc/06ShmFXUQuucErFEMJ8Ou9OwpF1b0BK+AK1nv2a4xl7Keea
         yl8Xaqs5NkyGSlfDQpd+Fo80P39CVfI3zT1LLdApqYdIqf9pT/IhVgfPPh+bYrM6Akw4
         B+8acJ6UPy9v7bT93opKChMePF2Ttn+Ruff+OZzIyo6YLvAcaH6v3DEQlcytK4X29OjK
         RxKg==
X-Gm-Message-State: AFuF++nZXkOCYK+JlP/V4Vgm6duEBRkguPObGXkCouD0PyhMUO8Vg0Iq
	OjuvxGwEB0zE2lNFAdtuhZoB8h5/GhCcphZ3V7angD5sr4gEQ3OsPSX85mLlvrAW5Mr5zIAjDkV
	BHHbOKWDJZA/d8/4bliB6+8V1SGClB/QWj9nDcMf1
X-Gm-Gg: AYBFou2/5nQ1B7Iw1mObi5rn6PZX9KZHK7ZXLgcW1ttN/HSsfc2ThiWeeda4KAGtyZ8
	MrGD0lwlYTWIKZOG/yKcT+AaBrRLrrP1rPh4bsIlz2ZAQIOai79DfrHCCmWH2gfsRpfHXJFG0ea
	bjRy8USm5LRTF/v+caWd7h1qKp2xoJnPi4Mg1kT8SwNGmn36JX9skunNj0xsrIWg/oP5Uk7BnD9
	qHbFENs6ycguVWW6Cms7cRJVbNpUnqiTJojAsm64p4qcKGBOGHx/5UEzRuy48DTG7fONmbVIK/C
	fWVAtUj66TvtYtXiGXCpHjeuZ8eOCVMLf8N4FRpB9S5q0hg3vVwPTYb0+fJ98CkIpSygDMbPScP
	ugevos/UU5Q==
X-Received: by 2002:a05:690c:281:b0:869:adba:625b with SMTP id
 00721157ae682-887a87bf532mr2501367b3.25.1789171061244; Fri, 11 Sep 2026
 16:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <aqQZzqJohIxBwnk0@SMW015318>
In-Reply-To: <aqQZzqJohIxBwnk0@SMW015318>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 11 Sep 2026 16:57:30 -0700
X-Gm-Features: AcwNN1WTU8WlhVvS_yNOKejgBbjum4EMT2blUBC4r1H9SFjK7U-mdGDrxdPBeGA
Message-ID: <CAHreonG_BH_ri7_p1VQ6h=_iTpWxhqzVLksc=p7Kyro2D3nW=Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_165744_250632_FB08A27A 
X-CRM114-Status: UNSURE (   9.56  )
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

> this is problem, Maybe we can use ioctrl to set default cmd, hdr/ sdr(default).

That makes sense.

We can keep read()/write() defaulting to I3C_SDR out of the box, and add an
ioctl (e.g. I3C_IOC_SET_MODE) to allow configuring the default mode and
command byte for that file descriptor if a user wants to use read()/write()
with HDR. How does that sound?

>How about this driver built-in and other devices build as modules, modules
>load maybe later than this driver?

This scenario is handled automatically by our bus notifier
(i3cdev_notifier_call):

When i3cdev is built-in, it attaches to unbound target devices at boot. If a
device driver module is loaded later (e.g. via modprobe), the driver core
emits BUS_NOTIFY_BIND_DRIVER right before binding the new driver.

Our notifier listens for BUS_NOTIFY_BIND_DRIVER and immediately calls
i3cdev_detach(), which unregisters the device clears i3cdev->i3c.
That way, i3cdev automatically steps aside whenever a dedicated driver
loads. And if that module is ever unloaded later, BUS_NOTIFY_UNBOUND_DRIVER
triggers i3cdev_attach() to re-expose the /dev node.

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
