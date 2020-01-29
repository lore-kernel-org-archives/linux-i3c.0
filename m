Return-Path: <SRS0=ZsAP=3S=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04DBC2D0DB
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2020 14:31:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BB520716
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2020 14:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glCnPP7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BB520716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LR8bidx2XLw4oGeTx75CFD/hfXMIDqUFRHPlfiygSQo=; b=glCnPP7Psl8JwV
	vqedcJHkY4NcLrcABrS/gxp/D5RSnTZMG/npU+igC1jaaxZdDh3sRs2BCWXk7X5WGi0i5IKs46ALH
	dqzlHwUmOvU9Mp3e5yp56i59TxJajyKcmBE5dP8aDO09JNkTVY+/HnJSDeQDmfwEU+D4W9D9mJlhI
	Wl8G/CCvx9lu0cT/F+1zOApH4TkctcfS3ZA2HF2MSDxCHHbJO33iHilMsDYjz+tBUuv67X2WsRzXf
	EDKdAuMqeEX5oP5tRr8jTzsyb5+kzWUYAzA2WZjBTfxKBdXTDMzMholQokUwZ3NgJ6oQTIvOF/HlQ
	d4Uuj97AwCczMEknZlgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwoNG-0006dn-H7; Wed, 29 Jan 2020 14:31:22 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwoND-0006cm-8o
 for linux-i3c@lists.infradead.org; Wed, 29 Jan 2020 14:31:20 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mwfj0-1jlsaX1Otm-00yAYi for <linux-i3c@lists.infradead.org>; Wed, 29 Jan
 2020 15:31:15 +0100
Received: by mail-qt1-f171.google.com with SMTP id c5so3825229qtj.6
 for <linux-i3c@lists.infradead.org>; Wed, 29 Jan 2020 06:31:14 -0800 (PST)
X-Gm-Message-State: APjAAAWsU4hAXuChzvydN95cL2ou+4vouVf6vu0UV9XMRYqrwlxXvM36
 slYTKYOlheQfClezIN3waezX6517n9fP2FZjalM=
X-Google-Smtp-Source: APXvYqyAUPRTN/4PzvPi5NueZDdmGdAafYBIacuzV4RqMoCyPeL4BrXrRFatMmY/bm62fbzhnzIPFlOzCWlcdR5pSJA=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr27089460qtr.7.1580308273837; 
 Wed, 29 Jan 2020 06:31:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <442a0c2c52223f9ff1a1d1018ff863fb23105389.1580299067.git.vitor.soares@synopsys.com>
In-Reply-To: <442a0c2c52223f9ff1a1d1018ff863fb23105389.1580299067.git.vitor.soares@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jan 2020 15:30:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0uFjhuO7e-i3r_RiA_ni=S8MfYoZUwZzmbXRcd=+kMKw@mail.gmail.com>
Message-ID: <CAK8P3a0uFjhuO7e-i3r_RiA_ni=S8MfYoZUwZzmbXRcd=+kMKw@mail.gmail.com>
Subject: Re: [RFC v2 4/4] i3c: add i3cdev module to expose i3c dev in /dev
To: Vitor Soares <Vitor.Soares@synopsys.com>
X-Provags-ID: V03:K1:+693V11UsNoEvuuAdfIfAZxyOtMCDnl7Ps7ZfkySbZ+e2SrY1FG
 UHLmsd0W8H0wyKdZNwNSrbhkAoCJjH559Lm0epUYnHiGrUixuj1ok6Pg79M/GVPdwxkUun1
 AZS9Eyk1VqmezniLm9K2uC9+yNYn0DDM2Eip/Ixy+itw/IpirzaF/pEBiyqTlMUGETiQN3Z
 SRKwa77gPTRrMMVUC12qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NW3lHxn4QuE=:lVivnGBBAlEsVYEiTIa6ny
 OWEm38jXkK7UcgFggy5YH/VusXGiILtl7fbXye9bCY+jPPcN/DYRecgQO1NmHDHQpmbBMewqE
 vVRISHZTMV/6Z+8stC9Yudb3HhH93mT/t3ffgjmgThwJqTxI5x33dAMMYOPN+xzzbhgLXKKuz
 O92dALLhs4xQFnyH2lhx7/ot2LrJ3+wjulWyrqEuY46ed19J1Cl/tXuWoi8pRaqDUY5o1cCbZ
 4HwdJwCr/xQd0KO7t8NAGAaBIL6/w/GK5W26RKj0RD7y6v6uCBkEylAC5rtd3ekfIC/DI1R80
 nIHxcVuy+YGGluefQSHe5f5xrg3YJLx8gYiY44CiPo4U0HHKGxAGIdBlSL6wfWwY9Tewc47bU
 EImIE62iAMUYVx/dmz9OX6S9+NZizSuTfuJa+5kOzLSNLKZ+HO9wdvXYtDMHehnGVqpuRyVfR
 gJWKM/i46pNaoOQn7O+uH9FXN4wGWfX335WWaUgrmleon1xx2OVHAvcyCgOE1k7ukbov62Esi
 Q56TIge53nzYfwpmLeMVNsI+LtNLWaY/vSw+zUdysNhVestAERIdt3AQ+bMfdEwTk6lrWSQ1Z
 YM3icud7YJLuwYX6vuC/yFkYZ4B38Htq2vHYsuzlTCxkXJLzAR+gdCvywS5Qnkpf+z+FrJlIU
 R7vxoOKcV6qP4y84WL2PInLqFcvpCK4IUaZl9WReyulpAIvFhUYKn7jJO9RzaYkLRHUNtIoqn
 QUwJu8GWsjFuV6iccEZeC4dIddDB8eX4fdEkHKsOGNp4ipJ3I6AeEooPmf/9JBAL2bIJi2b9V
 tTJI4iOqkFXT4bSa2Js5B67QbFERL6QPx5ZNBjCHHxcbCvt1qc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_063119_606026_C3BBAF1E 
X-CRM114-Status: GOOD (  19.30  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Boris Brezillon <bbrezillon@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@the-dreams.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Jan 29, 2020 at 1:17 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>
> +
> +struct i3cdev_data {
> +       struct list_head list;
> +       struct i3c_device *i3c;
> +       struct cdev cdev;
> +       struct device *dev;
> +       int id;
> +};
> +
> +static DEFINE_IDA(i3cdev_ida);
> +static dev_t i3cdev_number;
> +#define I3C_MINORS 16 /* 16 I3C devices supported for now */
> +
> +static LIST_HEAD(i3cdev_list);
> +static DEFINE_SPINLOCK(i3cdev_list_lock);

Please try to avoid arbitrarily limiting the number of devices you support.

Searching through the list feels a little clumsy. If the i3c user interface is
supposed to become a standard feature of the subsystem, it would seem
appropriate to put a pointer into the device to simplify the lookup, or
just embed the cdev inside of i3c_device.

> +static int
> +i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
> +                   unsigned int nxfers)
> +{
> +       struct i3c_priv_xfer *k_xfers;
> +       u8 **data_ptrs;
> +       int i, ret = 0;
> +
> +       k_xfers = kcalloc(nxfers, sizeof(*k_xfers), GFP_KERNEL);
> +       if (!k_xfers)
> +               return -ENOMEM;
> +
> +       data_ptrs = kcalloc(nxfers, sizeof(*data_ptrs), GFP_KERNEL);
> +       if (!data_ptrs) {
> +               ret = -ENOMEM;
> +               goto err_free_k_xfer;
> +       }

Maybe use a  combined allocation to simplify the error handling?

> +       for (i = 0; i < nxfers; i++) {
> +               data_ptrs[i] = memdup_user((const u8 __user *)
> +                                          (uintptr_t)xfers[i].data,
> +                                          xfers[i].len);

> +               if (xfers[i].rnw) {
> +                       if (copy_to_user((void __user *)(uintptr_t)xfers[i].data,
> +                                        data_ptrs[i], xfers[i].len))

Use u64_to_user_ptr() here.

> +
> +static struct i3c_ioc_priv_xfer *
> +i3cdev_get_ioc_priv_xfer(unsigned int cmd, struct i3c_ioc_priv_xfer *u_xfers,
> +                        unsigned int *nxfers)
> +{
> +       u32 tmp = _IOC_SIZE(cmd);
> +
> +       if ((tmp % sizeof(struct i3c_ioc_priv_xfer)) != 0)
> +               return ERR_PTR(-EINVAL);
> +
> +       *nxfers = tmp / sizeof(struct i3c_ioc_priv_xfer);
> +       if (*nxfers == 0)
> +               return NULL;
> +
> +       return memdup_user(u_xfers, tmp);
> +}
> +
> +static int
> +i3cdev_ioc_priv_xfer(struct i3c_device *i3c, unsigned int cmd,
> +                    struct i3c_ioc_priv_xfer *u_xfers)
> +{
> +       struct i3c_ioc_priv_xfer *k_xfers;
> +       unsigned int nxfers;
> +       int ret;
> +
> +       k_xfers = i3cdev_get_ioc_priv_xfer(cmd, u_xfers, &nxfers);
> +       if (IS_ERR_OR_NULL(k_xfers))
> +               return PTR_ERR(k_xfers);
> +
> +       ret = i3cdev_do_priv_xfer(i3c, k_xfers, nxfers);

The IS_ERR_OR_NULL() usage looks suspicious. It's generally
better to avoid interfaces that require this. What does it mean to
return NULL from i3cdev_get_ioc_priv_xfer() and turn that into
success? Could you handle this condition in the caller instead,
or turn it into an error?

> +       /* Keep track of busses which have devices to add or remove later */
> +       res = bus_register_notifier(&i3c_bus_type, &i3c_notifier);
> +       if (res)
> +               goto out_unreg_class;
> +
> +       /* Bind to already existing device without driver right away */
> +       i3c_for_each_dev(NULL, i3cdev_attach);

The combination of the notifier and searching through the devices
seems to be racy. What happens when a device appears just before
or during the i3c_for_each_dev() traversal?

What happens when a driver attaches to a device that is currently
transferring data on the user interface?

Is there any guarantee that the notifiers for attach and detach
are serialized?

> +/**
> + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> + * @data: Holds pointer to userspace buffer with transmit data.
> + * @len: Length of data buffer buffers, in bytes.
> + * @rnw: encodes the transfer direction. true for a read, false for a write
> + */
> +struct i3c_ioc_priv_xfer {
> +       __u64 data;
> +       __u16 len;
> +       __u8 rnw;
> +       __u8 pad[5];
> +};
> +
> +
> +#define I3C_PRIV_XFER_SIZE(N)  \
> +       ((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> +       ? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> +
> +#define I3C_IOC_PRIV_XFER(N)   \
> +       _IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))

This looks like a reasonable ioctl definition, avoiding the usual problems
with compat mode etc.

      Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
