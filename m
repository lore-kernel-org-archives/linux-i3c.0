Return-Path: <SRS0=ZsAP=3S=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5FDC2D0DB
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2020 19:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3912620716
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2020 19:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJOi83dE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3912620716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZaimQCuJh3/Y/S5lk5ipUz+RfH3RWjFhL4nZBcW8MI=; b=hJOi83dEVkgWTK
	Iy2wVC7iQDwdZN5IE3BAJY+RkR45q9sBMDXD3xYTCAGoh8Ak8Tw0WL2S/IxSt/SC6v4nDl9dyUHJJ
	wOcZv4iXIxqtZmkpw//zHhfyB437AMuER28UYW2sKrSEIBiQDjosnNNA5ciRfGsn3X1YbW4FlFQVG
	5y92zkANqBSNu/qar+zNKTscaAMw2OY6j8w4k7FKW9dn50Ihs6BaLHU80kvVh5MaWlsyg9JCqIp7n
	uWyV4F+t1ZDeEYq5W2woGvomDsYHFZB/34G8nhrmm3BqI84FNG1ZOYHztnChmuqYL19kayMUhSKbu
	OqZ/d852b0RPnPunSU0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwtC0-0006nI-DB; Wed, 29 Jan 2020 19:40:04 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwtBx-0006HP-DI
 for linux-i3c@lists.infradead.org; Wed, 29 Jan 2020 19:40:03 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MmkfQ-1jOpMO442w-00jqWc for <linux-i3c@lists.infradead.org>; Wed, 29 Jan
 2020 20:39:59 +0100
Received: by mail-qt1-f180.google.com with SMTP id d5so478090qto.0
 for <linux-i3c@lists.infradead.org>; Wed, 29 Jan 2020 11:39:58 -0800 (PST)
X-Gm-Message-State: APjAAAXiwPKVdWjaEEmYh7QCt2X1yU3Xk3OJlGEcfUMWywXsxPGUsShY
 Fb/IhWYLLh/DUxQJscybRon5Y7GemD+zl+0asxw=
X-Google-Smtp-Source: APXvYqzACP3TO+P6FLWJ5jTCyPG3LZ4i+VNkUByFIqUFh0dA9JI+62Ze5H6Yh9WsU2nlxUJY9emmgZMupGdGnoSZrHg=
X-Received: by 2002:ac8:34b2:: with SMTP id w47mr881540qtb.142.1580326797791; 
 Wed, 29 Jan 2020 11:39:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <442a0c2c52223f9ff1a1d1018ff863fb23105389.1580299067.git.vitor.soares@synopsys.com>
 <CAK8P3a0uFjhuO7e-i3r_RiA_ni=S8MfYoZUwZzmbXRcd=+kMKw@mail.gmail.com>
 <CH2PR12MB4216ED068AD93C43B2C421A8AE050@CH2PR12MB4216.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB4216ED068AD93C43B2C421A8AE050@CH2PR12MB4216.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jan 2020 20:39:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a384ksr95FTxcxr=48G-ytUqmAru7g1JT-Pdfpt1DcLMg@mail.gmail.com>
Message-ID: <CAK8P3a384ksr95FTxcxr=48G-ytUqmAru7g1JT-Pdfpt1DcLMg@mail.gmail.com>
Subject: Re: [RFC v2 4/4] i3c: add i3cdev module to expose i3c dev in /dev
To: Vitor Soares <Vitor.Soares@synopsys.com>
X-Provags-ID: V03:K1:iKWkgLHbLoAn4fjlZNvz/4xgSowNLfuSb4MEYm0aIbg5fIDKHiO
 WwnXvJsY7gm8qnRRaRk2NSlEC6uhN+S/J+Gzu1yPmM2Wzik+nO0Kqn/2/tYt5hM9TQGhHTa
 ugQsvDmKaKNCM+SeAGvB9F+tUa8sGTcnCto1uAbqQUvadWcRjGPbNdizcVK+eDLVSR8PpFN
 /k15XTO6tkz8WFzOXHVBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pOEZ6wLKPVg=:FEmyAwy7uylWo/axgMhuhf
 EVx2YDDGXpilO6HlNc5Gd4msb6lN1o6ba/VPcqiXeRUyavO122mvlU22ewo7Vj59J4PtmbgQv
 mCDiBXc7JGHeb3NlaxKzvc+P2CKLdZr119TWq6xCYYe43VY8w8ylgqBNUev026mKd5CQgcNP4
 Rrv+zYTEU0vejyRhcULWikQqlvIyHZtEzt40JNRtwoaXmPGNEBHx4tebNL26j2Wvg3sXRaQun
 N3pdKdL0KLAjX1ZXNWKt/i3N3Tz9DqjblsOBcutWZ7OD1yHzdXhcXrYAx5O+KP3HALCi1O8Ee
 t1s/OSXLQKSnI0FaTyudSjJXvM8Bcz0PL1K/Lvi8HXt/Ot7KqcsAnbFReogWp1r/dNm9IrgLW
 pukrsQTc2ntaGR2twO3pA18I0fO7iQZDRYTvSZvHFKZSRwNLpchRyKoRuRFq+wEtbuIULnbPS
 aZOGRIUwexf7eXSkGYQI7PXKeXukTKp8UJCE4TGMz31fboku7LjHD5ui6v0/VjdA0mj6bh4K+
 haYglBx3KWerFzv2VUYdqt2KsBJX3LQxhaQR9bFn+jA9Ukf8VtjaXVeqzn2SACpWSqe/gxLdB
 s14dMZiCcvbqRGCEz+SAigUqXv20YziNNxvYuosPqLYXbEMg/XNrqvQ6BVGjv2ioVcVVso/ed
 FuG2dHFRstLCEdprR50mK/Z8DP0tbmBPZZdkUjONnbNP110M0l2iYFP8L3ns0QtiCLtMPZ+D5
 0aAIiiNjKpsrh/zil0HCMQZ+54LQjP2+06/EsDjpOrWB/ghCUK8fzpM764EmQqXddvh6sEq1A
 BD9nPo5rHO2H3QNSxhVSmEGgAZLVR2Qb4ugSr6i0fnet0wVASo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_114001_759340_131B5333 
X-CRM114-Status: GOOD (  31.40  )
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
 Wolfram Sang <wsa@the-dreams.de>, gregkh <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Jan 29, 2020 at 6:00 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>
> Hi Arnd,
>
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Wed, Jan 29, 2020 at 14:30:56
>
> > On Wed, Jan 29, 2020 at 1:17 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >
> > > +
> > > +struct i3cdev_data {
> > > +       struct list_head list;
> > > +       struct i3c_device *i3c;
> > > +       struct cdev cdev;
> > > +       struct device *dev;
> > > +       int id;
> > > +};
> > > +
> > > +static DEFINE_IDA(i3cdev_ida);
> > > +static dev_t i3cdev_number;
> > > +#define I3C_MINORS 16 /* 16 I3C devices supported for now */
> > > +
> > > +static LIST_HEAD(i3cdev_list);
> > > +static DEFINE_SPINLOCK(i3cdev_list_lock);
> >
> > Please try to avoid arbitrarily limiting the number of devices you support.
>
> Should I use all minors range instead?

Yes, I'm fairly sure that if you use a dynamic major number, there
is no downside in using all of them.

> > Searching through the list feels a little clumsy. If the i3c user interface is
> > supposed to become a standard feature of the subsystem, it would seem
> > appropriate to put a pointer into the device to simplify the lookup,
>
> Do you mean i3c->dev ?

I was thinking you could add another member in i3c_device, next to ->dev.

> > or
> > just embed the cdev inside of i3c_device.
>
> I would prefer to have a pointer in i3c_device for i3cdev_data, but I see
> others using it in drvdata.

Ok, I think drvdata should work, but you should check that this is
correct when the device goes back between being bound to a device
driver and used through the chardev.

> >
> > > +static int
> > > +i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
> > > +                   unsigned int nxfers)
> > > +{
> > > +       struct i3c_priv_xfer *k_xfers;
> > > +       u8 **data_ptrs;
> > > +       int i, ret = 0;
> > > +
> > > +       k_xfers = kcalloc(nxfers, sizeof(*k_xfers), GFP_KERNEL);
> > > +       if (!k_xfers)
> > > +               return -ENOMEM;
> > > +
> > > +       data_ptrs = kcalloc(nxfers, sizeof(*data_ptrs), GFP_KERNEL);
> > > +       if (!data_ptrs) {
> > > +               ret = -ENOMEM;
> > > +               goto err_free_k_xfer;
> > > +       }
> >
> > Maybe use a  combined allocation to simplify the error handling?
>
> Could you please provide an example?

Something like

       k_xfers = kcalloc(nxfers, sizeof(*k_xfers) +
sizeof(*data_ptrs), GFP_KERNEL);
       data_ptrs = (void *)k_xfers + (nxfers, sizeof(*k_xfers));

This would need a comment to explain the pointer math, but the resulting
object code is slightly simpler.

> > > +       /* Keep track of busses which have devices to add or remove later */
> > > +       res = bus_register_notifier(&i3c_bus_type, &i3c_notifier);
> > > +       if (res)
> > > +               goto out_unreg_class;
> > > +
> > > +       /* Bind to already existing device without driver right away */
> > > +       i3c_for_each_dev(NULL, i3cdev_attach);
> >
> > The combination of the notifier and searching through the devices
> > seems to be racy. What happens when a device appears just before
> > or during the i3c_for_each_dev() traversal?
>
> The i3c core is locked during this phase.

Ok.

> > What happens when a driver attaches to a device that is currently
> > transferring data on the user interface?
> >
>
> It may lost references for inode and file. I need to guarantee there no
> tranfer going on during the detach.
> Do you have any suggestion?

If the notifier is blocking, you could hold another mutex during the transfer
I think.

> > Is there any guarantee that the notifiers for attach and detach
> > are serialized?
> >
>
> Sorry I didn't get this part.

I think you answered this above: if the i3c code is locked while calling
the notifier, this cannot happen.

> > > +/**
> > > + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> > > + * @data: Holds pointer to userspace buffer with transmit data.
> > > + * @len: Length of data buffer buffers, in bytes.
> > > + * @rnw: encodes the transfer direction. true for a read, false for a write
> > > + */
> > > +struct i3c_ioc_priv_xfer {
> > > +       __u64 data;
> > > +       __u16 len;
> > > +       __u8 rnw;
> > > +       __u8 pad[5];
> > > +};
> > > +
> > > +
> > > +#define I3C_PRIV_XFER_SIZE(N)  \
> > > +       ((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> > > +       ? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> > > +
> > > +#define I3C_IOC_PRIV_XFER(N)   \
> > > +       _IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
> >
> > This looks like a reasonable ioctl definition, avoiding the usual problems
> > with compat mode etc.
>
> Do you think I should add more reserved fields for future?

No, what I meant is that I like it the way it is.

     Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
