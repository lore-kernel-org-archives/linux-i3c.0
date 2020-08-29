Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE2C43461
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C72214F1
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMGZzoez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C72214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1rlXQiJ76RGDvp/zf10nY7TmpBk+G2u3hMbC1zaGJtg=; b=tMGZzoezfZzA4z5tNp/P5aO6XR
	Jzo85YWx+IhjudlPxwjBnjOE6GVdBJtl3GK+VGw/LxNXM2CVGEyHtbo4YkopZCu0T3zGuOd/g9rYS
	t4AWkASyvgglyC+WNg6Y/BVXVjIhRUG5oouRedh9274M16DTBowIxA6/BMrkHUS79WztaJhpySXWT
	2Bl3QBe4CJI+fKKViGgIWZruAU72IGbBiAb8riUHMFQlMUjjl2Zd1+w7fBvTVsbapM+kN3BRnFyQ5
	fB2WokF5L8a7Rsk7I9WVr2Su7ArqFZiYNvOL8nllW3LFW2bMERt18HEmMEH3goprErj26jnCkIP3F
	JyFYwWMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVq-0007qD-So
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:54 +0000
Received: from smtprelay0176.hostedemail.com ([216.40.44.176]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC5W5-0007g2-Ev; Sat, 29 Aug 2020 18:23:54 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 1D990182CED5B;
 Sat, 29 Aug 2020 18:23:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: humor54_0f10f2427080
X-Filterd-Recvd-Size: 6548
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Sat, 29 Aug 2020 18:23:44 +0000 (UTC)
Message-ID: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Subject: sysfs output without newlines
From: Joe Perches <joe@perches.com>
To: LKML <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Kees Cook <keescook@chromium.org>, "Gustavo A . R .
 Silva" <gustavoars@kernel.org>,  Julia Lawall <julia.lawall@inria.fr>, Alex
 Dewar <alex.dewar90@gmail.com>
Date: Sat, 29 Aug 2020 11:23:43 -0700
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_142353_569404_60600AB7 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:02:53 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
 linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Kai =?ISO-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 Pete Zaitcev <zaitcev@redhat.com>, linux-i3c@lists.infradead.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, linux-scsi@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, York Sun <york.sun@nxp.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 platform-driver-x86@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Alex Dubov <oakad@yahoo.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 linux-spi@vger.kernel.org, James Morse <james.morse@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

While doing an investigation for a possible treewide conversion of
sysfs output using sprintf/snprintf/scnprintf, I discovered
several instances of sysfs output without terminating newlines.

It seems likely all of these should have newline terminations
or have the \n\r termination changed to a single newline.

Anyone have any objection to patches adding newlines to these
in their original forms using sprintf/snprintf/scnprintf?

A few of these might be false positives as
	"%s", string
might already have string with a newline termination.

+++ drivers/edac/fsl_ddr_edac.c
+	return sysfs_emit(data, "0x%08x",
+	return sysfs_emit(data, "0x%08x",
+	return sysfs_emit(data, "0x%08x",
+++ drivers/edac/synopsys_edac.c
+	return sysfs_emit(data, "Data Poisoning: %s\n\r",
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+	return sysfs_emit(buf, "%u", !!(data->status & mask));
+	return sysfs_emit(buf, "%u", data->tcrit2[index] * 1000);
+	return sysfs_emit(buf, "%d",
+	return sysfs_emit(buf, "%u", data->tcrit1[index] * 1000);
+	return sysfs_emit(buf, "%d",
+	return sysfs_emit(buf, "%d", data->toffset[index] * 500);
+++ drivers/i3c/master.c
+		return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
+	return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
+	return sysfs_emit(buf, "%s", dd->boardversion);
+	return sysfs_emit(buf, "%s", dd->serial);
+	return sysfs_emit(buf, "%s", (char *)ib_qib_version);
+	return sysfs_emit(buf, "%s", dd->boardversion);
+	return sysfs_emit(buf, "%s", dd->lbus_info);
+	return sysfs_emit(buf, "ipac:f%02Xv%08Xd%08X", idev->id_format,
+++ drivers/memstick/core/mspro_block.c
+	return sysfs_emit(buffer, "%s", (char *)s_attr->data);
+	return sysfs_emit(buf, "%s",
+	return sysfs_emit(buf, "%s",
+++ drivers/misc/mei/bus.c
+	return sysfs_emit(buf, "%s", cldev->name);
+	return sysfs_emit(buf, "%pUl", uuid);
+	return sysfs_emit(buf, "%02X", version);
+	return sysfs_emit(buf, "mei:%s:%pUl:%02X:",
+	return sysfs_emit(buf, "%d", maxconn);
+	return sysfs_emit(buf, "%d", fixed);
+	return sysfs_emit(buf, "%d", vt);
+	return sysfs_emit(buf, "%u", maxlen);
+	return sysfs_emit(buf, "%s", mei_dev_state_str(dev_state));
+++ drivers/misc/tifm_core.c
+	return sysfs_emit(buf, "%x", sock->type);
+			return sysfs_emit(buf, "%s",
+	return sysfs_emit(buf, "%d", dev->net_count);
+++ drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
+		return sysfs_emit(buf, "%llx",
+		return sysfs_emit(buf, "none");
+++ drivers/net/ethernet/ibm/ehea/ehea_main.c
+	return sysfs_emit(buf, "%d", port->logical_port_id);
+++ drivers/net/wireless/intel/ipw2x00/ipw2200.c
+		return sysfs_emit(buf, "%s", priv->prom_net_dev->name);
+	return sysfs_emit(buf, "0x%04X",
+	return sysfs_emit(buf, "%d", il->retry_rate);
+	return sysfs_emit(buf, "%pOF", np);
+	return sysfs_emit(buf, "pcmcia:m%04Xc%04Xf%02Xfn%02Xpfn%02X"
+++ drivers/platform/x86/dell-smbios-base.c
+		return sysfs_emit(buf, "%08x", da_tokens[i].location);
+		return sysfs_emit(buf, "%08x", da_tokens[i].value);
+	return sysfs_emit(buf, "%08x",
+++ drivers/scsi/st.c
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+++ drivers/spi/spi-tle62x0.c
+	return sysfs_emit(buf, "%d", value);
+++ drivers/usb/class/cdc-acm.c
+	return sysfs_emit(buf, "%d", acm->ctrl_caps);
+	return sysfs_emit(buf, "%d", acm->country_rel_date);
+++ drivers/usb/class/usblp.c
+	return sysfs_emit(buf, "%s", usblp->device_id_string+2);
+	return sysfs_emit(buf, "usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02X"
+++ drivers/usb/misc/cytherm.c
+	return sysfs_emit(buf, "%i", cytherm->brightness);
+	return sysfs_emit(buf, "%c%i.%i", sign ? '-' : '+', temp >> 1,
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+	return sysfs_emit(buf, "%d", retval);
+	return sysfs_emit(buf, "%d", retval);



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
