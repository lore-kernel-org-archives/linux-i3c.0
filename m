Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB59DF94CC3
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Apr 2026 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xEMV6uvIPGY4xvDhIz5wTb55K19EuiWUoXAAGm0Xts=; b=kZ8ipiG2eW4Ctz
	jk8VD+zwhEd7Ltptx7GJl5oizHxIQfvuH6rF4stHQi6j67d4YGi6LfEJnZEOIFfyQA8Cr8LBS9rtC
	NUjI0q78Iy72gBdGC9EZcGp7gzH0FqOgBa2ItbVnP5dNSH6CUGS+kjQ2fv//XLG+9cybjlx6Leevo
	qmMfWeUyjwT7TwyzWh6aHQVVpzwjZFi+lWgKwvuTE2CBcIfOzRwLdOg3uQ5yuqOIOCj/Rm0A6N0dV
	alr+Rkl9Nj7Ti38WbaOk8IqTNpfxryHflLP6usMezjmyym4G6437z3hloWzzwbW9btgTozs0uP7/y
	AKObMlicKADGg2xqB6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOkb-00000009ZLK-32uY;
	Wed, 22 Apr 2026 03:59:47 +0000
Received: from mail-francesouthazon11011048.outbound.protection.outlook.com ([40.107.130.48] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOkY-00000009ZKm-2zWk
	for linux-i3c@lists.infradead.org;
	Wed, 22 Apr 2026 03:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrZeRYM/n0TUclqM11wkW2rCJh9ODzi/9FSkN+QcXa+4De4ek/Xcu/8W43w4pNcOcpI9kv1PdbA2vJOcQo8FC9MoKsktfJBlIjQvY6WIqpDpscyjCbUElouqJQ2lCelVLPRBZDpgIapuEzhK1POGMcELak91Hhd8ZWSuiq9IjyICaTOqxY2Mc84aDdGR6jOKl+u4hwLvUJYb1xbwc2Pc+jDy8Zf1SjA/kVce32yWwqKDCszXpyBdJM7vKlRBy6zCldciQcT3svJirGWRrb2mxwMXhZ8Vbpa9JGrRGtT0tDrzSAum6wldkl/ihyyAW5D6H5cLCEqwaoCeCh7Iuf5Dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fES0ZlTSfbACunYNAtUAIYM+HS4orgqB9/xjoIzMloM=;
 b=jj5pKmo4i8OQ055yQbtT9zR7rdibk40hTm/G43RwfWynFc8Noq221eQP08kPapM9jQtEzDByFg+Q8GeEXxGYwl201emN5212zFgQZV9MnR3uBqORCcqZ27vFnLRShI4XnFsekPkIrhUJD9Ccbd2iQv8cRDSTd5tigJdWvj7wbR4QIjRJxXzp8JPLa/l7aoH9jwrLlTu02E2HawUSnNFW9cXs/4Ub4L80q0mypThzTkDNv0O4hn27fpipz4dhEW8M0FtFl6WQB9w2nnKphYNT6lb6taSKnf2KCkkbwcyeUlkYTWgO/Lwyl6lts2fZUtTES3gLbtbHoQSeGxGfUTrhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fES0ZlTSfbACunYNAtUAIYM+HS4orgqB9/xjoIzMloM=;
 b=RKLQaQBaKFSyEiO63lgAn16o+TLjpcLDQgsTdiCUmLOmy/615+qc9v1Xt4gamCgk7oJZilmiVqPOKMYl/LP1LS/GAUxKmZALvpcp1ASOw3Oaat8kByKU1PKZ8X3nOx5NfDyeFRs9xXMNYL15MV3XGZ7oceqmRSGHabc0lDmK/C+DWSKzTKEGwnp22Q88EWPaUD/8TAUy/0BsI+djkxjHvj/Re8sbtWu72D0SfrlQ0XOSFCBs83y1MFnse6aGW6oPBbb0IKqL8LnsalDp2HAHeTk1s+A9QYqeThWrkxHDMgWGLTiU9Grh0en7gdiLSw5FdeSzDy3yyfoYekhNxFCtaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 03:59:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:59:38 +0000
Date: Tue, 21 Apr 2026 23:59:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: Replace sprintf() with sysfs_emit()
 family
Message-ID: <aehHpE4fwau1IHVx@lizhi-Precision-Tower-5810>
References: <20260421214837.20939-1-m32285159@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260421214837.20939-1-m32285159@gmail.com>
X-ClientProxiedBy: SN7P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbdc1bf-72ee-43f4-db12-08dea02392d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lXUFHzQzj9fK10fU/zXfrPXKaPGMtmN3SLGdkdw6/6u8oaq1ymhWeBD7N20QKk6Y7ng3A/Sk5/amMU/GGg7pFioTLm0o2W2XOSRF7UK418spRddtFbnNZZFO3EGhX4ROxVAF2uLuHNPS0aZBo3y37CvWshhvRUAQmEUY7iOLQThRUPR9TPtaulqMeqxkplPK3TRZFPYSBozTJcPhNStiVYFjd4ap9I/lDOV350dZjqverSMLYCO7uqrUXDui7jMfxftG9cwOIYcnjfYhbWpjoeTuQYck7jWtfNP1WBpD5ojw0KOd06NrsvdZEPVKweX7VN1giJveAKAtVD60tkZ3VWthGRow1YD6FxyjKUkzHDB8zu104/j/qBDjXmCUy5Jx6mShnmNM5MBG01xNIdj0OdfuA5Z+17ZhwQGjpBH1FMtPoSdJ0H/dcDoA2aHWYyupHyockNxC38x+RSQXApqUiqxdmjOLiG3+zoO0zwkH54k6BXau41IrHF6SVnv3wka1TNIQLW+Ie/8o2q3jI661XIjYrrn60dxqnYV8/jnZc1GqX3O2vwdzuu3N307seYZiI//dsouXs7MRxuxYl1q6kNTnqEGHSaypEVq0qwFr8Njb3aAek4joOeh1PGbACy2SN4jrrcP82GQrtA6grilQQOoZyhKI/axwa0K4NSQyjvVsI2PrQcVvIWKbBoLQ+kIJrRyLZFzHsP2JQDHZ3AERNyVeIbQM0R6ZoFd+M6NwaJkh9Hs7jbeWvViuL/Ve7EuPm6ChEXK0qeUVf3Cc95A/vCg5yDndayeBqGY8U5lTjrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jiIqZMjZY8h28kNWqmTayE02Ofz5ueLBZUQ6dWph4a1xTGSfUEYoOO5VrCfA?=
 =?us-ascii?Q?L3nMUbhWfdadedPYMbIYlibJYOWwSmNHSmKrpidgY8hrpOvIZ42u2eForC4M?=
 =?us-ascii?Q?BwryuVwofw1HJfWZvGqLKt1MOVeX6ZVXo920tXE4SpI8NK58XT537M15wwGt?=
 =?us-ascii?Q?2mgO0Uj2ka9dyp1AXCCeGrDb17XT/OLzP6eSAqiDcL4AThf/spFyVdwT1fTE?=
 =?us-ascii?Q?gfDykNGl9VcDKFi5DmAPKH72UZ+7aUYfMG6aa3YLxQzsNyFnkZp54hIzt+8+?=
 =?us-ascii?Q?i1yyr7uh+ob2sYeJFLiOmi8rknTFrj4YAzB+PXIEhpoFpFKdVJ0/KUe9ci/+?=
 =?us-ascii?Q?j5JPj8DIlj4MWoFGnPGCJWv/qloaIOiXSyEwK2See9QIDCHnvMPNWPHk+Rc3?=
 =?us-ascii?Q?UZIETVIUORX6CqJTmh1+SOX41Qf9p0YBkmEx60rzgPKBJt9EOWeLmyytZ/Au?=
 =?us-ascii?Q?8G72LHjXOAWSJr8hYKMzNM6cCJVVEVhoMuQ0dcnSTuA3LZ8U8yTgIJC9n9UX?=
 =?us-ascii?Q?lEXVTDiRyeK9+W6iFvC+kMe502JSZgYQLQK5H5hH0QxqZhE6CiufhuyQoEBv?=
 =?us-ascii?Q?YyGHHkYP/YWiPNpJOo98R5EiKxImraAOa9Dd1XXdka5lu/gWk0R/aqs8nEck?=
 =?us-ascii?Q?BrTZjKigHWG76jOYRT2GHQpGq4aFlAutNF8UfWvqAp/gvqUSOqgFqhWLN7HM?=
 =?us-ascii?Q?96YUBGFkog2euLVMB2KtvvNNWE37HpjlmdFJVFP1Bfw7rHwp0ruIcUAe14EO?=
 =?us-ascii?Q?4b1lIDW4ifhSNynXeuE8SYOURaQs/JXUPXIgvfjiVOQPST8z/pzNtMTUA+YY?=
 =?us-ascii?Q?dsKijv9xbKk2HKQ3YW9DEYzbaPe88qaeKzrMXRpVcjTZ/mSos+7h/8hEN8So?=
 =?us-ascii?Q?jFx5eZukRMTXEWHD+Qr1nicXs2bBKNWySRDepKX8d9BJzgraL2x+/y2bdZ1I?=
 =?us-ascii?Q?7mPcrfuvF7733aV0czDa2M73k1uHghWUJCjCMA0Cv0oETAECmA2+Bd02jLQi?=
 =?us-ascii?Q?6Xe2KqgWIeaTfBx0c4qhsofjnJYbAHuYACQXlv+3nN8ZSa4v86BRuqoVE6rU?=
 =?us-ascii?Q?2cWNVJnULTJpF1lHIB5Tf4AQfqAqmxs5O6/fjPqJAVPssPC0bwKZ3s6E67Ek?=
 =?us-ascii?Q?cWzU3op1ilRLJUYQlulspwOZm7tuZYOw3z3lgUdECwW9POyO5gUHeGQXvyGT?=
 =?us-ascii?Q?idTUmS+OKtSyrpIE4zAtrllpmGNH59D0WV43ZJMRZY8DE2MNzT/JoWqb9dFh?=
 =?us-ascii?Q?Q71zrUxkz498r7oPla0Ttqvy//K9ZfE2hUFYKD5eMyhi3xkMvGemNyEn9dZ8?=
 =?us-ascii?Q?HjoTbyl/zzHB5KobDyLyusMWFTRJroaQ1AyXbEYAdFGdc+j5SWCJT3p+5XKf?=
 =?us-ascii?Q?4kLDPo7pcl4W9SCsj5o2rppuovUtxm8t/uLDdJ63iP1573BxZEQ2RNMfQaYs?=
 =?us-ascii?Q?I8w/FqA3TLEk/ie2X/M+TITkMFz7hxDa8wIakPoxtROg5jZCKLnduRPWSFl5?=
 =?us-ascii?Q?50/mAv3aImwW+T/RLZW2mP4Zn0oJXLl3ccz3VsihdxrkJlm+gzuXnzphDI09?=
 =?us-ascii?Q?hm5J0S4VgCuhG+31GPJCq6dLchSAjR2Nm4DiTVYxcgZJHTVA4CcRzk4HuSbu?=
 =?us-ascii?Q?nuG5E/jik0L8ESE3HlMUQkHdnjHPwkONf+uI/yqRIXe1vzv4CBqBBdTlhT4n?=
 =?us-ascii?Q?kxG64FlWnN0Gyc4gN+msKzfLh3q3qUrU8ZTyB5dVEgruQnWuSaizsKyPZslr?=
 =?us-ascii?Q?u70wcPTYUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbdc1bf-72ee-43f4-db12-08dea02392d6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:59:38.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+35qcshvQkFlP8DtfQ3v817LByyvMc+52LF+bS0r4aCCMpyF+1Kr9/0W0qxiHwWldrUw98PhoUAEjMckYnaUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_205942_782700_DF943175 
X-CRM114-Status: GOOD (  17.11  )
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

On Tue, Apr 21, 2026 at 04:48:37PM -0500, Maxwell Doose wrote:
> Replace sprintf() function calls with sysfs_emit() and
> sysfs_emit_at() function calls where appropriate. This will help
> harden the driver and help modernize it. While at it, add missing
> newlines at the end of some sysfs_emit() (formerly sprintf()) calls.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  v2:
>  - Change commit message to use imperative voice as suggested by Frank
>    Li.
>
>  drivers/i3c/master.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2..c0d19eae06b9 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -174,7 +174,7 @@ static ssize_t bcr_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "0x%02x\n", desc->info.bcr);
> +	ret = sysfs_emit(buf, "0x%02x\n", desc->info.bcr);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> @@ -191,7 +191,7 @@ static ssize_t dcr_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "0x%02x\n", desc->info.dcr);
> +	ret = sysfs_emit(buf, "0x%02x\n", desc->info.dcr);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> @@ -208,7 +208,7 @@ static ssize_t pid_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "%llx\n", desc->info.pid);
> +	ret = sysfs_emit(buf, "%llx\n", desc->info.pid);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> @@ -225,7 +225,7 @@ static ssize_t dynamic_address_show(struct device *dev,
>
>  	i3c_bus_normaluse_lock(bus);
>  	desc = dev_to_i3cdesc(dev);
> -	ret = sprintf(buf, "%02x\n", desc->info.dyn_addr);
> +	ret = sysfs_emit(buf, "%02x\n", desc->info.dyn_addr);
>  	i3c_bus_normaluse_unlock(bus);
>
>  	return ret;
> @@ -256,7 +256,7 @@ static ssize_t hdrcap_show(struct device *dev,
>  		if (!hdrcap_strings[mode])
>  			continue;
>
> -		ret = sprintf(buf + offset, offset ? " %s" : "%s",
> +		ret = sysfs_emit_at(buf, offset, offset ? " %s" : "%s",
>  			      hdrcap_strings[mode]);
>  		if (ret < 0)
>  			goto out;
> @@ -264,7 +264,7 @@ static ssize_t hdrcap_show(struct device *dev,
>  		offset += ret;
>  	}
>
> -	ret = sprintf(buf + offset, "\n");
> +	ret = sysfs_emit_at(buf, offset, "\n");
>  	if (ret < 0)
>  		goto out;
>
> @@ -290,10 +290,10 @@ static ssize_t modalias_show(struct device *dev,
>  	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
>
>  	if (I3C_PID_RND_LOWER_32BITS(devinfo.pid))
> -		return sprintf(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
> +		return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04X\n", devinfo.dcr,
>  			       manuf);
>
> -	return sprintf(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
> +	return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X\n",
>  		       devinfo.dcr, manuf, part, ext);
>  }
>  static DEVICE_ATTR_RO(modalias);
> @@ -578,9 +578,9 @@ static ssize_t mode_show(struct device *dev,
>  	if (i3cbus->mode < 0 ||
>  	    i3cbus->mode >= ARRAY_SIZE(i3c_bus_mode_strings) ||
>  	    !i3c_bus_mode_strings[i3cbus->mode])
> -		ret = sprintf(buf, "unknown\n");
> +		ret = sysfs_emit(buf, "unknown\n");
>  	else
> -		ret = sprintf(buf, "%s\n", i3c_bus_mode_strings[i3cbus->mode]);
> +		ret = sysfs_emit(buf, "%s\n", i3c_bus_mode_strings[i3cbus->mode]);
>  	i3c_bus_normaluse_unlock(i3cbus);
>
>  	return ret;
> @@ -595,7 +595,7 @@ static ssize_t current_master_show(struct device *dev,
>  	ssize_t ret;
>
>  	i3c_bus_normaluse_lock(i3cbus);
> -	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> +	ret = sysfs_emit(buf, "%d-%llx\n", i3cbus->id,
>  		      i3cbus->cur_master->info.pid);
>  	i3c_bus_normaluse_unlock(i3cbus);
>
> @@ -611,7 +611,7 @@ static ssize_t i3c_scl_frequency_show(struct device *dev,
>  	ssize_t ret;
>
>  	i3c_bus_normaluse_lock(i3cbus);
> -	ret = sprintf(buf, "%ld\n", i3cbus->scl_rate.i3c);
> +	ret = sysfs_emit(buf, "%ld\n", i3cbus->scl_rate.i3c);
>  	i3c_bus_normaluse_unlock(i3cbus);
>
>  	return ret;
> @@ -626,7 +626,7 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
>  	ssize_t ret;
>
>  	i3c_bus_normaluse_lock(i3cbus);
> -	ret = sprintf(buf, "%ld\n", i3cbus->scl_rate.i2c);
> +	ret = sysfs_emit(buf, "%ld\n", i3cbus->scl_rate.i2c);
>  	i3c_bus_normaluse_unlock(i3cbus);
>
>  	return ret;
> --
> 2.53.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
