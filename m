Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D14C5B55D
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Feb 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIaoyLvpaggPQdqQqrh0OKDQDvBOeepuqfNvnE6rB6M=; b=38U/2E0MEH2wc0
	mp/8yLdDVn8SXqUwmRePheYIUHzQc6S+WZ6JbeJGiDhD7hX5CnDFo2uPnZp3ONeYFKav7m2xnF3wR
	uiFv7Q+SDQ1gNK4p5vkQBOeJnvbfRWbabklR2KSaAmwIYc1GJRqf+XxpOKf0bjns+t0lpDmAZmyfF
	yKSamFlRs5KMP558siPd+bDiF7epiQ4A3FjkFtKu+W0u74UnMhQvbOLfwfFoif/GI25B21dbkNP4m
	fPXU6cFTfuGF7qVxbJdOlkOoSGyaTVJSFqaXeoQlUaXEqbxCBS97WinrbDpzL+z7VMhqCRp7REwCI
	rLCcF1bqZa1CnBffWQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXou-0000000Fc5E-3sPg;
	Fri, 20 Feb 2026 21:13:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXor-0000000Fc4T-2S0x
	for linux-i3c@lists.infradead.org;
	Fri, 20 Feb 2026 21:13:51 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id D8D5A20B6F00; Fri, 20 Feb 2026 13:13:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D8D5A20B6F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1771622027;
	bh=xvjA05Kd+i3BfXoggGGGdDiduwLRfsQeRP2h/l97qB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lb3Ew7scP91PZctTiLu7ULBtsK5yJV2LoP5+O/SCJS4oQSdhObccADXaemXv9uduV
	 QuSMkx93rNoqiA6ieax2NLDQTU6XChLNgLdCBtjvqM2h3n6pGm/lpT2yPDZMOnoT5l
	 6pbEWREfGoh0kvKP0CwJ8Qtpqi89OJHjpbrq6Bzg=
Date: Fri, 20 Feb 2026 13:13:47 -0800
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Frank Li <Frank.li@nxp.com>
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH v6] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <20260220-fb92aef7e431041d8d0bb2bc@linux.microsoft.com>
References: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
 <aZiGRrRIaqbMSaTI@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZiGRrRIaqbMSaTI@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_131349_657015_B4E49676 
X-CRM114-Status: GOOD (  28.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Feb 20, 2026 at 11:05:26AM -0500, Frank Li wrote:
> On Thu, Feb 19, 2026 at 09:58:03PM +0100, David Nystr=F6m wrote:
> > Allow userspace to request dynamic address assignment, which is
> > useful for i3cdev devices with broken hot-join support.
> > This will assign dynamic addresses to all devices on the I3C bus
> > which are currently unassigned.
> >
> > Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>

> > Changes in v6:
> > - Add check for init_done to close race with init.
> > - Link to v5: https://patch.msgid.link/20260219-i3c_rescan-v5-1-42404db=
20d18@est.tech
> >
> > Changes in v5:
> > - Change sysfs interface to boolean. Comment: Meagan Lloyd
> > - Change sysfs entry name to do_daa: Comment Megan Lloyd, Frank Li
> > - Link to v4: https://patch.msgid.link/20260126-i3c_rescan-v4-1-6b3559d=
82abc@est.tech
> >
> > Changes in v4:
> > - Improved commit message, once more. Comment: Frank Li
> > - Added required documentation for sysfs addition. Comment: Frank Li
> > - Link to v3: https://patch.msgid.link/20260123-i3c_rescan-v3-1-026429f=
a0c65@est.tech
> >
> > Changes in v3:
> > - Rename sysfs entry from rescan to entdda, Comment: Joshua Yeong
> > - Link to v2: https://patch.msgid.link/20260122-i3c_rescan-v2-1-84c74a4=
83f03@est.tech
> >
> > Changes in v2:
> > - Improved the commit message with why.
> > - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071=
e232b@est.tech
> > ---
> >  Documentation/ABI/testing/sysfs-bus-i3c | 20 ++++++++++++++++++++
> >  drivers/i3c/master.c                    | 27 +++++++++++++++++++++++++=
++
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/AB=
I/testing/sysfs-bus-i3c
> > index c1e048957a01..19f5cf8b1b11 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-i3c
> > +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> > @@ -172,3 +172,23 @@ Description:
> >  		the automatic retries. Exist only when I3C constroller supports
> >  		this retry on nack feature.
> >
> > +What:		/sys/bus/i3c/devices/i3c-<bus-id>/do_daa
> > +KernelVersion:  7.0
> > +Contact:	linux-i3c@vger.kernel.org
> > +Description:
> > +		Write-only attribute that triggers a Dynamic Address Assignment
> > +		(DAA) procedure which discovers new I3C devices on the bus.
> > +		Writing a boolean true value (1, y, yes, true, on) to this
> > +		attribute causes the master controller to perform DAA, which
> > +		includes broadcasting an ENTDAA (Enter Dynamic Address Assignment)
> > +		Common Command Code (CCC) on the bus. Writing a false value
> > +		returns -EINVAL.
> > +
> > +		This is useful for discovering I3C devices that were not present
> > +		during initial bus initialization and are unable to issue
> > +		Hot-Join. Only devices without a currently assigned dynamic address
> > +		will respond to the ENTDAA broadcast and be assigned addresses.
> > +
> > +		Note that this mechanism is distinct from Hot-Join, since this is
> > +		controller-initiated discovery, while Hot-Join is device-initiated
> > +		method to provoke controller discovery procedure.
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 0eae19b3823d..8f49d4ad473d 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -758,6 +758,32 @@ static ssize_t dev_nack_retry_count_store(struct d=
evice *dev,
> >
> >  static DEVICE_ATTR_RW(dev_nack_retry_count);
> >
> > +static ssize_t do_daa_store(struct device *dev,
> > +			    struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> > +	bool val;
> > +	int ret;
> > +
> > +	if (kstrtobool(buf, &val))
> > +		return -EINVAL;
> > +
> > +	if (!val)
> > +		return -EINVAL;
> > +
> > +	if (!master->init_done)
> > +		return -EAGAIN;
> > +
> > +	ret =3D i3c_master_do_daa(master);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_WO(do_daa);
> > +
> >  static struct attribute *i3c_masterdev_attrs[] =3D {
> >  	&dev_attr_mode.attr,
> >  	&dev_attr_current_master.attr,
> > @@ -769,6 +795,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
> >  	&dev_attr_dynamic_address.attr,
> >  	&dev_attr_hdrcap.attr,
> >  	&dev_attr_hotjoin.attr,
> > +	&dev_attr_do_daa.attr,
> >  	NULL,
> >  };
> >  ATTRIBUTE_GROUPS(i3c_masterdev);
> >
> > ---
> > base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
> > change-id: 20260116-i3c_rescan-4921d0b41a00
> >
> > Best regards,
> > --
> > David Nystr=F6m <david.nystrom@est.tech>
> >

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
