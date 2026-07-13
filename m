Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B7C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vt71XcokJ3GksQf70tmwIg+bF5qmXv9kgL6t1HPTS00=; b=GG3IT5qOZGlmEs
	ck4yzOvITlWhLfoh4uP1w8O/OXMrbSoauY2jOR3j8cSCKErXZjiQ21+hWefCnGQmkvna84Jkhjrex
	hIwHe76tN6UmR68kaspm3ick4bRO6sHyWa0iAPwZBtUf6tLRZpi2YBzwPnFvY7UaPs8aUiHg5fT0k
	Kul7ebDXFy3Ho3nMCylTjRscOCCKOiItTWWF3pz9vTr48NWmxD0iO8Ocn36ywVU2LQohKSnKkWW+o
	kL7m/Ydasw9ftc/1isiAaFoo+gBbJBemyn7LgJ45C8szhWFohqkCuU0EsHA6aP0PNNB/eqjp0BQma
	OS+0cjvA2vuhA4WHcdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEIm-00000008wBr-0cxl;
	Mon, 13 Jul 2026 10:54:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEIj-00000008wBS-0dN5
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 10:54:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e08baf860so409438a91.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 03:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940056; cv=none;
        d=google.com; s=arc-20260327;
        b=bKnzmqBGytElPhGad3OHRnd113GgMz/imqC8n8yNXlFljv1d1lDVMD1AKJZEhCnliF
         hWMRhS6PJ+Y+jqyN3PThzNNdP+j5GqsAhtwfWOJKGxMLRhGfMrpxmUlpy54dyhH0Gn6u
         FxiQ93BZ5CLE0ldYoMEwzeGNwPw2qUhX1fPumL9BgoO2Ia2A7MN8dL6ArSYof1ygBQCP
         riOMsZQ0WlAEUA7r1tpg9h5+LnAFNQFvWcH8yy/B9CsMJjBaYRI/dtySTdDDEVpEpxlg
         zO5rhkBj+t8jxKasVz5K9WOGfd2xKxG5lCsMMAxqBGuav8WmBs+Ho3Rv5MgxC54VEMWE
         9ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VsccIh1teQIB6PKWERAaqA4W9wXkj8HDgDTFHZV7+TE=;
        fh=pbsm90ZN5IJKQYGHf1Z9XTDH2aE6Wp1dekfgooI0foo=;
        b=JlkghbihkRTb1FsedkVoP7WkyBymI9CbbLXpO2pCQt1OF8UWipVsBo80hTtgAR0Maq
         +SA1t3FdsK69rtFu+9YYvsbo0fr+2t8SFmGaIn34nvDdrmg7WOatJvDOIA9XgXHYHKf+
         +2qYmYZUgHOzb1Wu7uh0i44LIiHcv7TwJChkNEXO+h+Ef+f5LRPxD7V+aS9xOC7u95OP
         AlM2wL1uFLrwrlAwGvC/hO9am2rocKn4cYtMY0p9XyLlZSlemfdupa9MFFXuLNshjWtO
         Y60hM37rb7Gul2OSVB7REUJMscsnWUN7NWfSA5Ztx/5KJMPbboZo8/rJ+L6gnMBtb1Iv
         udQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783940056; x=1784544856; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsccIh1teQIB6PKWERAaqA4W9wXkj8HDgDTFHZV7+TE=;
        b=eS6xxS6ffTa5h24Y1/gy//NjprifkqGS0fPEUnKDgH3dDbghmSQEklROrlEQdT4pfy
         DyPgVNEjaiwgQst06Dy69gnJYnTDLatN4C0k7dMdC57JJtRYDCAksEPShq7YcMctvgNn
         9tYXaLljFTQ2yrq3xaBsd9iVtV7xAh0PzHENTyuiXX9mzzscFRMfDz14+WQ9XVbwAUHz
         egtEvZncjI0o6S4peIQGs6wI/75KlXaiLSnmUJ22FhHTNMKH1Aj7R3UV+9Y7RdkVouq0
         T9wirPpthARfgYI49UUYu3Kxm1vvtmyB5kIdnUeafHnSBt0GDn2/gAqsEwQSVEPsD6Iw
         mv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940056; x=1784544856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsccIh1teQIB6PKWERAaqA4W9wXkj8HDgDTFHZV7+TE=;
        b=Dymtalr28E97xzsYPmre+RHJtH/U7uve5UXq3t0TFSd2QIVKDWzZbXkbBAfaFXBYp+
         LuzpMRkPdzVn3JHO6wad0cUDVFVzi2o3SS1hRxLZ6T3TOfBBICtaMIXdg4HO1VwsJzLu
         m0WA3czuXBSzxmxhcrdHicrrVpa38VtcUqANQh2zLqysKdh9sDrtd26AJilKm1EeO/fO
         IaqIDmLNcJmmaWm6Pl1z6Hp6wseGrdUhirj/LV+uEwbZHtBmf7L6J1jJipDt3G8v4hzd
         aEKFVUmZGF9TqkaDiNX1QuUpJrqmhsqp28qrkyI/q9uj9qAbIb/tcjo8yfQMNp3vtfpe
         iacQ==
X-Forwarded-Encrypted: i=1; AHgh+RotBPHaLKktiXfnInbTrHaGx9iM42p6/RgmXgfdQYP6+gzgR87A0Y1QxYQAh3genUdNKofMQLuBOJs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZbZWXEg18SYXdzvGK3y9ZlCE0Jf2sfw1pgnmWi+BMiPHmpqVb
	lTudGp0rBIkkjcDxf3rjh1S7Ml2ONxhGE0G9Wh1k5JOFhLkwQ3lqXxBa6hHZfECGAAZoWFX+xYL
	R8SLQW4yIxjPo9wq6Gk4FjIS+CgDePZ0=
X-Gm-Gg: AfdE7clwHULiMoqOQ5ykpta/LPawiPof6YubS56n9vSlNZlry/gGTYSbIrQlJinv8pn
	KIcJ6Kx7YOd1YI/yxcslzHqX4D2LwyWPzggCSKBFr8jrg00+RJZzz81Mr2eFfLEW10DXQQZoujH
	ZIw+4RujZRYcBUTXSwb46ODBgY3vf8FDEyEXitHXkgMs+AH+5RxviY9AOIEFgUYDSKoGTlSxyln
	Y4XcxQBAFC7id7G1r5YUChQkZVWog0I7HjrJIbysA+lwh1+CsNtih3jfdGif31VFIPXVq9VfA==
X-Received: by 2002:a17:90b:1fc4:b0:381:23d5:693f with SMTP id
 98e67ed59e1d1-38dc777c375mr8491205a91.28.1783940056348; Mon, 13 Jul 2026
 03:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260709071744.333403-3-Jm_Liao@asmedia.com.tw> <ak_vDyq9A60mGmny@lizhi-Precision-Tower-5810>
In-Reply-To: <ak_vDyq9A60mGmny@lizhi-Precision-Tower-5810>
From: =?UTF-8?B?5buW5bu66YqY?= <tim678910@gmail.com>
Date: Mon, 13 Jul 2026 18:54:04 +0800
X-Gm-Features: AUfX_mxMQSARce2U9OErzAzD5Gfmyosa2fDv5EA7zi1qaXBHT8fEM9k8ihNz16Y
Message-ID: <CAGfoLndKkRokHGhQocmbqkPxuAFFy91YMpP3K9AcA5rQbmCReA@mail.gmail.com>
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add PIO queue management support
 for HCI v1.2
To: Frank Li <Frank.li@oss.nxp.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, adrian.hunter@intel.com, 
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	Jm_Liao@asmedia.com.tw, Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw, 
	Patrick_Yen@asmedia.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_035417_194855_E3902A56 
X-CRM114-Status: GOOD (  19.92  )
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

On Fri, Jul 10, 2026 at 02:57:00AM +0000, Frank Li wrote:
>
> On Thu, Jul 09, 2026 at 03:17:43PM +0800, Jian-Ming Liao wrote:
> > - Support explicit enablement and starting of PIO queues as
> >   required by HCI v1.2.
> > - Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
> > - Implement explicit PIO queue stopping/disabling and restart
> >   logic after errors.
>
> Remove -
>
> Support explicit enablement and starting of PIO queues as required by
> HCI v1.2.
>
> Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
>
> Implement explicit PIO queue stopping/disabling and restart logic after
> errors.
>
> if you prefer -, need
>
> Some sentense ...
>   - abc...
>

Hi Frank,

Thank you for the feedback.

I will remove the '-' prefix in the commit message.

> >  #define IBI_STATUS_SIZE                      GENMASK(15, 8)
> >  #define CR_QUEUE_SIZE                        GENMASK(7, 0)
> >
> > +#define PIO_ALT_QUEUE_SIZE      0x1C
> > +#define EXT_IBI_QUEUE_EN        BIT(28)
> > +#define ALT_RESP_QUEUE_EN       BIT(24)
> > +#define ALT_RESP_QUEUE_SIZE     GENMASK(7, 0)
> > +
>
> Number start pos align to prevous GENMASK(7, 0) of CR_QUEUE_SIZE
>

I will fix it.

> >       __hci_pio_init(hci, &size_val);
> >
> > -     dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> > -             FIELD_GET(CR_QUEUE_SIZE, size_val));
> > -     dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> > -             4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> > -     dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
> > -             4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> > -     dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> > -             4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
> > -
>
> why need move this part?

I understand that unnecessary code movement makes the diff harder to review.
My intention for moving the dev_dbg lines was to place them after
calculating the adjusted resp_sz and ibi_val(which are dynamic in
v1.2) @ func "__hci_pio_init".
However, I agree with you, so I will revert the movement and calculate
the adjusted sizes(resp_sz, ibi_val) in place to keep the diff clean.


> > @@ -246,6 +280,12 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
> >               BUG_ON(pio->curr_rx);
> >               BUG_ON(pio->curr_tx);
> >               BUG_ON(pio->curr_resp);
> > +             /* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
> > +             if (hci->version_major == 1 && hci->version_minor >= 2)
> > +                     pio_reg_write(CONTROL, 0x0);
> > +
> > +             kfree(pio);
>
> why need kfree() here? if fix existing problem, use seperate patch.
>

I have verified that pio is managed by devm_kzalloc. I will remove the
manual kfree() to prevent potential double-free issues.

> > @@ -766,6 +806,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
> >               hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
> >       /* then reset the hardware */
> >       mipi_i3c_hci_pio_reset(hci);
> > +
> > +     /* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
> > +     if (hci->version_major == 1 && hci->version_minor >= 2) {
>
> Can you use helper macro this check, many place use similar check
>
> Frank
>

I agree that a helper macro for checking the HCI version is better for
maintainability.
I will define a helper like hci_version_at_least(hci, maj, min) and
use it to replace the hardcoded checks throughout the driver.

Best regards,
Jian-Ming Liao

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
